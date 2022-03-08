require 'rails_helper'

RSpec.describe User, :type => :model do

  subject { 
    described_class.new(
      id: 11,
      email: 'test@test.com',
      password: 'azerty',
      first_name: 'Max',
      last_name: 'Mad'
    )
  }

  it "User is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "User is not valid without an email" do
    subject.email = nil
    expect(subject).to_not be_valid
  end

  it "Firstname should have at least 2 cararacters" do
    subject.first_name = "M"
    expect(subject).to_not be_valid
  end
  
  it "Lastname should have at least 2 cararacters" do
    subject.last_name = "M"
    expect(subject).to_not be_valid
  end

  it "Password should be at least 6 caracters" do
    subject.password = "bla"
    expect(subject).to_not be_valid
  end

end