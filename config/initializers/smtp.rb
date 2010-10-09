Tumblepop::Application.config.action_mailer.delivery_method = :smtp
Tumblepop::Application.config.action_mailer.smtp_settings = {
  :address              => 'smtp.gmail.com',
  :port                 => 587,
  :domain               => 'tumblepop.com',
  :user_name            => 'stories@tumblepop.com',
  :password             => 'x5hKV8E1Ev',
  :authentication       => 'plain',
  :enable_starttls_auto => true  
}