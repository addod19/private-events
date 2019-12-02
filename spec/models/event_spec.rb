require 'rails_helper'

RSpec.describe Event, type: :model do

  context 'event validations test' do
    # event = Event.new(title: "Birthday party", location: "Accra", user_id: '2', description: "Daniel's party with Jack Daniels", date: "2020-02-03")

    it 'creates new valid event' do
      event = Event.new(title: "Birthday party", location: "Accra", user_id: '2', description: "Daniel's party with Jack Daniels", date: "2020-02-03")
      expect(event).to be_valid
    end

    it 'is invalid without event title' do
      event = Event.new(title: "", location: "Accra", user_id: '2', description: "Daniel's party with Jack Daniels", date: "2020-02-03")
      event.valid?
      expect(event.errors[:title]).to include("can't be blank")
    end

    it 'is invalid without event location' do
      event = Event.new(title: "Birthday party", location: "", user_id: '2', description: "Daniel's party with Jack Daniels", date: "2020-02-03")
      event.valid?
      expect(event.errors[:location]).to include("can't be blank")
    end

    it 'is invalid without event description' do
      event = Event.new(title: "Birthday party", location: "", user_id: '2', description: "", date: "2020-02-03")
      event.valid?
      expect(event.errors[:description]).to include("can't be blank")
    end
 
    it 'is invalid without event date' do
      event = Event.new(title: "Birthday party", location: "", user_id: '2', description: "", date: "")
      event.valid?
      expect(event.errors[:date]).to include("can't be blank")
    end
 
    it 'is invalid with title shorter than specified' do
      event = Event.new(title: "party", location: "", user_id: '2', description: "", date: "2020-02-03")
      event.valid?
      expect(event.errors[:title]).to include("is too short (minimum is 10 characters)")
    end
 
    it 'is invalid with title longer than specified' do
      event = Event.new(title: "party" * 10, location: "", user_id: '2', description: "", date: "2020-02-03")
      event.valid?
      expect(event.errors[:title]).to include("is too long (maximum is 40 characters)")
    end
 
    it 'is invalid with description shorter than specified' do
      event = Event.new(title: "party" * 10, location: "", user_id: '2', description: "abdc", date: "2020-02-03")
      event.valid?
      expect(event.errors[:description]).to include("is too short (minimum is 30 characters)")
    end
 
    it 'is invalid with description longer than specified' do
      event = Event.new(title: "party" * 10, location: "", user_id: '2', description: "abdcefghjklmpnop" * 20, date: "2020-02-03")
      event.valid?
      expect(event.errors[:description]).to include("is too long (maximum is 250 characters)")
    end
   
  end
end