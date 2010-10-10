task :ask=>:environment do
  
  day = Day.find_by_date Date.today
  if day
    User.all.each do |user|
      ask = user.asks.build :question=>day.question
      if ask.save
        AskMailer.inquiry(ask).deliver
      end
    end
  end
  
end