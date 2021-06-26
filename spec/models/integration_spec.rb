require 'rails_helper'
require './spec/support/helpers'

feature 'User can' do
  background do
    tanzila = User.new(name: 'tanzila', email: 'tanzila@example.com', password: 'password')
    visit new_user_registration_path
    fill_in 'user_name', with: tanzila.name
    fill_in 'user_email', with: tanzila.email
    fill_in 'user_password', with: tanzila.password
    fill_in 'user_password_confirmation', with: tanzila.password
    click_button 'Sign up'
  end

  scenario 'create a post' do
    visit root_path
    fill_in 'post_content', with: 'this is my post'
    click_on 'Save'
    expect(page).to have_content('this is my post')
  end

  scenario 'all users page have' do
    visit users_path
    expect(page).to have_content('Name')
    expect(page).to have_link('See Profile')
    expect(page).to have_link('Add Friend')
  end
end
