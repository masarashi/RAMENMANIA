require 'rails_helper'

RSpec.describe User, type: :model do
  scenario 'has a valid factory' do
    expect(FactoryBot.build(:user)).to be_valid
  end

  scenario 'user login' do
    user = FactoryBot.build(:user)

    visit root_path

    click_link "ログイン"
    fill_in "user_email", with: "example@railstutorial.org"
    fill_in "user_password", with: "password"
    click_button "ログイン"
  end
end
