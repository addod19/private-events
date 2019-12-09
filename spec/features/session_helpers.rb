# frozen_string_literal: true

require 'spec_helper'

module Features
  module SessionHelpers
    def sign_up_with(name, email)
      visit sign_up_path
      fill_in 'Name', with: name
      fill_in 'Email', with: email
      click_button 'Sign up'
    end

    def sign_in
      user = create(:user)
      visit sign_in_path
      fill_in 'Email', with: user.email
      click_button 'Sign in'
    end
  end
end
