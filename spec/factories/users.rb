# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :valid_user, :class => User do
  	name 'alan'
  	email 'alan@example.com'
  	password 'alan'
  	password_confirmation 'alan'
  end

  factory :invalid_user, :class => User do
		name nil
		email nil
		password nil
		password_confirmation nil
	end
end
