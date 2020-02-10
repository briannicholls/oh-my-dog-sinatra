require 'spec_helper'

describe "Owner" do
  before do
    @scooby = Dog.create(name: "Scooby Doo")
    @shaggy = Owner.create(first_name: "Shaggy")
    @scooby.owner = @shaggy

    @scooby.save

    @owner = Owner.create(
      first_name: "Leo",
      address: '123 High St',
      phone: '123-456-7890',
      email: 'email@email.com',
      zip_code: '08123',
      lockbox_code: '1234',
      door_code: '4321'
    )
  end

  it "Has a name" do
    expect(@shaggy.first_name).to eq("Shaggy")
  end

  it "Has an address" do
    expect(@owner.address).to eq(@owner.address)
  end

  it "Has a phone number" do
    expect(@owner.phone).to eq(@owner.phone)
  end

  it "Has an email" do
    expect(@owner.email).to eq(@owner.email)
  end

  it "Has a zip code" do
    expect(@owner.zip_code).to eq(@owner.zip_code)
  end

  it "Has a lockbox or door code" do
    expect(@owner.door_code).to eq(@owner.door_code)
    expect(@owner.lockbox_code).to eq(@owner.lockbox_code)
  end

  it "Has many dogs" do
    expect(@shaggy.dogs.size).to eq 1
  end

end
