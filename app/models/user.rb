class User < ActiveRecord::Base
  
  #############################################################################
  #                         C L A S S    M E T H O D S                        #
  #############################################################################
  def self.authenticate(email, password)
    return nil if email.blank? || password.blank?
    person = self.find_by_email email
    person && (self.encrypt(password, person.password_salt) == person.password_hash) ? person : nil
  end

  def self.encrypt(password, salt) 
    Digest::SHA1.hexdigest(password + salt)
  end

  def self.generate_password
    numbers = ('0'..'9').to_a
    letters = ('a'..'z').to_a + ('A'..'Z').to_a
    password = ''
    2.times do
      3.times{ password << letters[rand(letters.size)]}
      password << numbers[rand(numbers.size)]
    end
    password
  end
  
  #############################################################################
  #                          R E L A T I O N S H I P S                        #
  #############################################################################
  has_many :asks
  has_many :stories, :through=>:asks
  
  #############################################################################
  #                              P A S S W O R D                              #
  #############################################################################
  attr_accessor :password
  before_save :encrypt_password
  def encrypt_password 
    return if password.blank?
    self.password_salt = [Array.new(6){rand(256).chr}.join].pack("m").chomp if new_record?
    self.password_hash = self.class.encrypt(password, self.password_salt) 
  end
  
  def reset_password
    new_password = User.generate_password
    self.password = new_password
    self.password_confirmation = new_password
    new_password
  end
  
  def update_password?
    new_record? || !password.blank?
  end
        
  #############################################################################
  #                             V A L I D A T I O N                           #
  #############################################################################
  attr_protected :admin, :password_hash, :password_salt
  
  validates_presence_of     :name

  validates_presence_of     :email
  validates_format_of       :email, :with => /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}/
  validates_length_of       :email, :within => 5..100
  validates_uniqueness_of   :email, :case_sensitive => false

  validates_confirmation_of :password,                 :if=>:update_password?
  validates_length_of       :password, :within=>6..40, :if=>:update_password?
  validates_presence_of     :password_confirmation,    :if=>:update_password?
  
end
