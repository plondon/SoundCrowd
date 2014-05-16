require 'spec/helper'

describe "User Session" do
  context "When the user visits the homepage" do
    it "a sign in form can be seen" do
      visit root_path
      find_link('Register')
    end
    it "the Register button will be redirect them to sign up page" do
      visit root_path
      find_link('Register').click
      expect(current_path).to eq(new_user_path)
    end
  end

  describe "When a user signs in" do
    let!(:user) { create :user }
    it "a session is created" do
      visit root_path
      fill_in "Email", :with => user.email
      fill_in "Password", :with => user.password
      find_button('Sign In').click
      expect(page).to have_content(user.email)
    end
  end

end
