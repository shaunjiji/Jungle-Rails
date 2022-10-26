require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'should create valid user' do
      user = User.create(
        first_name: "Shaun",
        last_name: "Jiji",
        email: "shaun@gmail.com",
        password: "shaun",
        password_digest: "shaun"
        )
      expect(user).to be_valid
    end

    it 'should have password and password confirmation' do
      user = User.create(
        first_name: "Shaun",
        last_name: "Jiji",
        email: "shaun@gmail.com",
        password: "shaun",
        password_digest: nil
        )
      expect(user).to_not be_valid
    end

    it 'should not save without unique email' do
      @user = User.create(
        first_name: "Shaun",
        last_name: "Jiji",
        email: "shaun@gmail.com",
        password: "shaun",
        password_digest: "shaun"
        )
      @user2 = User.create(
        first_name: "Shaun",
        last_name: "Jiji",
        email: "shaun@GMAIL.com",
        password: "shaun".
        password_digest: "shaun"
        )
    expect(@user2).to_not be_valid
    end

    it 'should have matching password and password confirmation' do
      password = User.create(
        first_name: "Shaun",
        last_name: "Jiji",
        email: "shaun@gmail.com",
        password: "shaun",
        password_confirmation: "lighthouse"
        )
      expect(password).to_not be_equal(password.password_confirmation)
    end

    it 'should have a first name to be a valid user' do
      user = User.create(
        first_name: nil,
        last_name: "Jiji",
        email: "shaun@gmail.com",
        password: "shaun",
        password_digest: "shaun")
      expect(user).to_not (be_valid)
    end

    it 'should have a password with a minimum length of 3' do
      user = User.create(
        first_name: "Shaun",
        last_name: "Jiji",
        email: "shaun@gmail.com",
        password: "sh",
        password_confirmation: "sh"
        )
      expect(user).to_not be_valid
    end




  end




end

