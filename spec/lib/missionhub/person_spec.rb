require_relative '../../spec_helper'

describe MissionHub::Person do
  let(:person) { MissionHub::Person.new }

  describe "Set Address" do
    it "must throw exception when address is wrong type" do
      address_error = lambda { person.address = '' }
      address_error.must_raise RuntimeError
    end

    it "must be able to set address" do
      address = MissionHub::Person::Address.new
      person.address = address
      person.address.must_equal address
    end
  end

  describe "Set Email" do
    it "must throw exception when email is empty" do
      email_error = lambda { person.email_address = '' }
      email_error.must_raise RuntimeError
    end

    it "must throw exception when email has invalid domain" do
      email_error = lambda { person.email_address = 'mail@example.com' }
      email_error.must_raise RuntimeError
    end

    it "must be able to set email" do
      email = "mail@gmail.com"
      person.email_address = email
      person.email_address.must_equal email
    end
  end

  describe "Set Gender" do
    it "must throw exception when gender isn't male/female" do
      gender_error = lambda { person.gender = 'not_gender' }
      gender_error.must_raise RuntimeError
    end

    it "must be able to set gender to male" do
      gender = "male"
      person.gender = gender
      person.gender.must_equal gender
    end

    it "must be able to set gender to female" do
      gender = "female"
      person.gender = gender
      person.gender.must_equal gender
    end
  end

  describe "Set Name" do
    it "must be able to set first name" do
      person.first_name = "First"
      person.first_name.must_equal "First"
    end

    it "must be able to set last name" do
      person.last_name = "Last"
      person.last_name.must_equal "Last"
    end

    it "must be able to get full name" do
      person.first_name = "First"
      person.last_name = "Last"
      person.full_name.must_equal "First Last"
    end
  end

  describe "Set Answers" do
    it "must be able to set survey answer" do
      id = 1598
      message = "true"
      person.set_answer id, message
      person.get_answer(id).must_equal message
    end
    it "must throw exception when answer is wrong type" do
      id = 1598
      message = 1
      address_error = lambda { person.set_answer id, message }
      address_error.must_raise RuntimeError
    end
  end
end
