require 'spec_helper'
describe "User pages" do
 subject { page }

 describe "signup page" do
 	before { visit signup_path }
 	it {should have_slector('h1', text: 'Sign up')}
 	it {should have_slector('title', text: full_title('Sign up'))}
 end
 describe "profile page" do
 	let(:user){ FactoryGirl.create(:user) }
before { visit user_path(user) }
 	it {should have_slector('h1', text: user.name)}
 	it {should have_slector('title', text: user.name)}
end

# describe "Sign up" do
# 	before { signup_path }
# 	describe "with invalid information" do
# 		it {should_not create a user} do
# 			old_count = User.count
# 			click_button "Create my account"
# 			new_count = User.count
# 			new_count.should == old_count
# 		end
# 	end
# end
# 	describe "with valid information" do
# 		it {should create a user} do
# 			fill_in "name", with: "Example User"
# 			fill_in "email", with: "gazi@gmail.com"
# 			fill_in "password", with: "foobar123"
# 			fill_in "password_confirmation", with: "foobar123"
# 			new_count = User.count
# 			new_count.should == old_count + 1
# 		end
# 	end
# end

describe "signup" do

    before { visit signup_path }

    let(:submit) { "Create my account" }

    describe "with invalid information" do
      it "should not create a user" do
        expect { click_button submit }.not_to change(User, :count)
      end
      describe "after submission" do
      	before {click_button submit}

      	it { should have_slector('title', text: 'sign up')}

      	it { should have_content('error')}

      	it { should_not have_coontent('password digest')}
      end
    end

    describe "with valid information" do
      before do
        fill_in "Name",         with: "Gazi Tarique"
        fill_in "Email",        with: "gazi@gmail.com"
        fill_in "Password",     with: "foobar123"
        fill_in "Confirmation", with: "foobar123"
      end

      it "should create a user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end

      describe "After saving a user" do
      	before { click_button submit }
      	let(:user) {User.find_by_email("gazi@gmail.com")}
      	it{ should habe_selector('title', text: user.name)}
      	it {should have_selector('div.alert.alert-success', text: 'Welcome')}
      end
    end
  end
end
