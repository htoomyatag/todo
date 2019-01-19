require 'rails_helper'
require 'capybara/rails'

require 'spec_helper'


feature 'sign_in' do
  scenario 'sign in with correct email and password' do
    visit "/dashboard"
    fill_in 'email', with: 'htoomyatag1@gmail.com'
    fill_in 'password', with: '12345678'
    click_button 'Login'
    expect(page).to have_content('Logout')
  end 
end

