class User < ActiveRecord::Base
  
  attr_accessor  :password
  
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
        
  attr_protected :admin, :password_hash, :password_salt

  validates_confirmation_of :password,                 :if=>:update_password?
  validates_length_of       :password, :within=>6..40, :if=>:update_password?
  validates_presence_of     :password_confirmation,    :if=>:update_password?
  
  protected
  def update_password?
    new_record? || !password.blank?
  end
  
end
