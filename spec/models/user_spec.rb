# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  context 'user validates presence test' do
    it ' ensures name presence ' do
      name = User.new(name: 'Nick Haras', email: 'nick@gmail.com').save
      expect(name).to eq(true)
    end

    it ' ensures email is presence ' do
      email = User.new(name: 'Nick Haras', email: 'nick@gmail.com').save
      expect(email).to eq(true)
    end

    it 'is invalid with user name longer than specified' do
      user = User.new(name: 'ababa' * 12, email: '')
      user.valid?
      expect(user.errors[:name]).to include('is too long (maximum is 40 characters)')
    end

    it 'is invalid with user name shorter than specified' do
      user = User.new(name: 'ababa', email: '')
      user.valid?
      expect(user.errors[:name]).to include('is too short (minimum is 10 characters)')
    end
  end

  context 'user validates absence test' do
    it ' identifies email absence ' do
      email = User.new(name: 'Nick Haras', email: '').save
      expect(email).to eq(false)
    end

    it ' identifies name absence ' do
      name = User.new(name: '', email: 'nick@gmail.com').save
      expect(name).to eq(false)
    end
  end
end
