require 'rails_helper'

RSpec.describe Property, :type => :model do

  user = User.new(
    id: 11,
    email: 'test@test.com',
    password: 'azerty',
    first_name: 'Max',
    last_name: 'Mad'
  )
  
  subject { 
    described_class.new(
      title: 'Superflat',
      price: 130000,
      description: 'This flat is awesome',
      address: 'Rue du Flat',
      user: user
    )
  }

  it "Property is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "Property should belongs to a user" do
    subject.user = nil
    expect(subject).to_not be_valid
  end

  it "Property needs a title of 5 to 144 caracters" do
    subject.title = nil
    expect(subject).to_not be_valid
    subject.title = 'Bla'
    expect(subject).to_not be_valid
  end
  
  it "Property needs a title" do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it "Property needs a description of 5 to 144 caracters" do
    subject.description = 'Bla'
    expect(subject).to_not be_valid
  end

  it "Property needs a price" do
    subject.price = nil
    expect(subject).to_not be_valid
  end
  
  it "Property needs a price which is an integer" do
    subject.price = 'hundred thousands'
    expect(subject).to_not be_valid
    subject.price = 130000.2
    expect(subject).to_not be_valid
  end

end