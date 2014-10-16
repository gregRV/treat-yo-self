require 'rails_helper'

RSpec.describe UsersController, :type => :controller do
	let(:user) {FactoryGirl.create(:valid_user)}

	describe "#new" do
		it "gets successful resposne" do
			expect {response.to be_successful}
		end

		it "builds a new instance of user" do
			expect {assigns(:user).to be_a(User)}
		end
	end

	describe "#create" do
		context "with valid info" do
			it "creates a new user" do
				expect {
					post 'create', {user: FactoryGirl.attributes_for(:valid_user)}
				}.to change{ User.count }.by(1)
			end

			it "redirects to user#show" do
				post 'create', {user: FactoryGirl.attributes_for(:valid_user)}
				expect {response.to redirect_to(action: 'show')}
			end
		end

		context "with invalid info" do
			it "does not create a new user" do
				expect {
					post 'create', {user: FactoryGirl.attributes_for(:invalid_user)}
				}.to_not change{User.count}
			end

			it "renders user#new" do
				post 'create', {user: FactoryGirl.attributes_for(:invalid_user)}
				expect {response. to_render('new')}
			end
		end
	end

	describe "#show" do
		it "displays the correct user info" do
			get 'show', {id: user.id}
			# after ensuring that the route/action exists, some of these tests
			# are passing for no apparent reason! (here, #show is empty!)
			expect {response.body has_content("sdflkjsdflkjdsklf")}
		end
	end
end
