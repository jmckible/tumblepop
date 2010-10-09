require 'mailman'
require 'mailman/receiver/pop3'

Mailman.config.poll_interval = 30

Mailman.config.pop3 = {
  :username => 'stories@tumblepop.com',
  :password => 'x5hKV8E1Ev',
  :server   => 'pop.gmail.com',
  :port     => 995,
  :ssl      => true
}

Mailman::Application.run do  
  to 'stories+%secret%@tumblepop.com' do
    ask = Ask.find_by_secret params[:secret]
  end
end