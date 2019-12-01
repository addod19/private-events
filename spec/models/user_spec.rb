require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  context 'user validations test' do
    it ' ensures name presence ' do
      name = User.new(:name => 'Nick Haras', :email => 'nick@gmail.com').save
      expect(name).to eq(true)
    end

    it ' identifies name absence ' do
      name = User.new(:name => '', :email => 'nick@gmail.com').save
      expect(name).to eq(false)
    end

    it ' ensures email is presence ' do
      email = User.new(:name => 'Nick Haras', :email => 'nick@gmail.com').save
      expect(email).to eq(true)
    end

    it ' identifies email absence ' do
      email = User.new(:name => 'Nick Haras', :email => '').save
      expect(email).to eq(false)
    end
  end
end
