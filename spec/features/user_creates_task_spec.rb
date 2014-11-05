require 'rails_helper'

feature 'user can view their newly created task' do
	let(:user) {FactoryGirl.create(:valid_user)}

	context 'when logged in' do
		it 'displays task info' do
			visit new_user_task_path(user)

			fill_in 'Title', with: 'Clean Room'
			fill_in 'Description', with: 'Clean desk, vacuum, and make bed.'
			fill_in 'Reward', with: 1
			click_button 'Submit'

			expect(page).to have_content('Clean Room')
		end

		it 'displays notice that task was successfully created' do
			visit new_user_task_path(user)

			fill_in 'Title', with: 'Clean Room'
			fill_in 'Description', with: 'Clean desk, vacuum, and make bed.'
			fill_in 'Reward', with: 1
			click_button 'Submit'

			expect(page).to have_content('Successfully created Task!')
		end
	end
end