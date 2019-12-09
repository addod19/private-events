# frozen_string_literal: true

require 'spec_helper'

feature 'User signs up' do
  scenario 'with valid name and email' do
    sign_up_with 'valid name', 'nickharas@gmail.com'
    expect(page).to have_content('Sign in')
  end

  scenario 'with invalid name' do
    sign_up_with 'invalid_name', 'nickharas@gmail.com'
    expect(page).to have_content('Sign in')
  end

  scenario 'with invalid email' do
    sign_up_with 'example name', '123456'
    expect(page).to have_content('Sign in')
  end

  def sign_up_with(name, email)
    visit signup_path
    fill_in 'Name', with: name
    fill_in 'Email', with: email
    click_button 'Create User'
  end
end
