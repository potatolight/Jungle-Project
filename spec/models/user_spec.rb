require 'rails_helper'

RSpec.describe User, type: :model do
  subject {
    described_class.new(first_name: "Victor",
                        last_name: "Zhange",
                        email: "test@test.com",
                        password: "1234",
                        password_confirmation: "1234"
                        )
  }
  describe 'Validations' do 
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end
    it "is not valid password is not equal to password_confirmation" do
      user1 = User.new(first_name: "Victor",
                        last_name: "Zhange",
                        email: "test@test.com",
                        password: "1234",
                        password_confirmation: "1245")
      
      expect(user1).not_to be_valid
    end

    it "is not valid without an email" do
      subject.email = nil
      expect(subject).not_to be_valid
    end
    it "is not valid without an first_name" do
      subject.first_name = nil
      expect(subject).not_to be_valid
    end
    it "is not valid without an last_name" do
      subject.last_name = nil
      expect(subject).not_to be_valid
    end
    it "is not valid without an last_name" do
      expect(subject.email).not_to eq ("TEST@test.com")
    end
    it "is not valid if password is too short" do
      user2 = User.new(first_name: "Victor",last_name: "Zhange",email: "test@test.com",password: "12", password_confirmation: "12")
      expect(user2).not_to be_valid 
    end 
  end
  describe '.authenticate_with_credentials' do
     it 'is authenticate with valide password and email' do
      user = User.new(first_name: 'yy', last_name: 'bb', email: '123@123.com', password: '1234', password_confirmation: '1234')
      user.save
      valid_user = User.authenticate_with_credentials('123@123.com', '1234')
      expect(valid_user).to eq(user)
    end
    it 'is not authenticate with invalide email' do
      user = User.new(first_name: 'yy', last_name: 'bb', email: '123@123.com', password: '1234', password_confirmation: '1234')
      user.save
      expect(User.authenticate_with_credentials("12@123.com", "1234")).not_to eq(user)
    end
    it 'is not authenticate with invalide password' do
      user = User.new(first_name: 'yy', last_name: 'bb', email: '123@123.com', password: '1234', password_confirmation: '1234')
      user.save
      expect(User.authenticate_with_credentials("123@123.com", "123")).not_to eq(user)
    end
    it 'is authenticate with valide password and email with extra space' do
      user = User.new(first_name: "Grace", last_name: "Bai", email: "123@123.com", password: "1234", password_confirmation: "1234")
      user.save!
      expect(User.authenticate_with_credentials("     123@123.com   ", "1234")).to eq(user)
    end
    it 'is authenticate with valide password and email with different case'  do
      user = User.new(first_name: "Grace", last_name: "Bai", email: "eXample@domain.COM", password: "1234", password_confirmation: "1234")
      user.save!
      expect(User.authenticate_with_credentials("     EXAMPLe@DOMAIN.CoM   ", "1234")).to eq(user)
    end

  end
end
