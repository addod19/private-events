# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :feature do
  describe User do
    it ' should have many events ' do
      u = User.reflect_on_association(:events)
      expect(u.macro).to eq(:has_many)
    end

    it ' should have many invitations ' do
      u = User.reflect_on_association(:invitations)
      expect(u.macro).to eq(:has_many)
    end
  end
end
