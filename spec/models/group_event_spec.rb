require 'rails_helper'

RSpec.describe GroupEvent, type: :model do
  User.create(name: "test", email: "test@test.com", password: 1234456)
  subject {GroupEvent.create(name: "Test event",
     description: "test description",
     status: 0,
     duration: 15,
     start_date: DateTime.now + 5.days,
     user_id: 1) }

  it 'should test valid  draft' do
    subject.name = "test draft event"
    expect(subject).to be_valid
  end

  it 'should test validation for name for draft' do
    subject.name = nil
  expect(subject).to_not be_valid
  end

  it 'should test publishing with all attributes for draft' do
    subject.status = 1
    expect(subject).to be_valid
  end

  it 'should test publishing without duration ' do
    subject.duration = nil
    subject.status = 1
    expect(subject).to_not be_valid
  end

  it 'should test publishing without start_date' do
    subject.start_date = nil
    subject.status = 1
    expect(subject).to_not be_valid
  end

  it 'should test publishing without description ' do
    subject.description = nil
    subject.status = 1
    expect(subject).to_not be_valid
  end

end
