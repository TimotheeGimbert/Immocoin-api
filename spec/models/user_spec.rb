require 'rails_helper'

RSpec.describe User, :type => :model do
  
  subject { 
    described_class.new(
      email: 'test@test.com'
    )
  }

  it "User is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "User is not valid without an email" do
    subject.email = nil
    expect(subject).to_not be_valid
  end

end