require 'rails_helper'

describe 'user login process', :type => :feature do
	context 'with valid info' do
		let(:user) {FactoryGirl.create(:valid_user)}
		before(:each) do
			visit new_session_path

			fill_in 'Email', with: user.email
			fill_in 'Password', with: user.password
			click_button 'Log In'
		end

		it 'redirects user to user#show' do
			expect(current_path).to eq(user_path(user))
		end

		it 'displays notice of successful login' do
			expect(page).to have_content('Login Successful')
		end
	end

	context 'with invalid info' do
		let(:user) {FactoryGirl.create(:valid_user)}
		before(:each) do
			user.email = ''
			visit new_session_path

			fill_in 'Email', with: user.email
			fill_in 'Password', with: user.password
			click_button 'Log In'
		end

		it 'shows the login page' do
			expect(page).to have_content('Log In')
		end

		it 'displays an alert that login failed' do
			expect(page).to have_content('Login Failed')
		end
	end
end