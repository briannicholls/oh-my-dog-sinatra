require 'spec_helper'

describe "Dog" do
  before do
    @scooby = Dog.create(name: "Scooby Doo")
    @shaggy = Owner.create(first_name: "Shaggy")
    @scooby.owner = @shaggy

    @scooby.save
    @dog = Dog.create(
      name: 'Lassie',
      breed: 'Poodle',
      birthday: '9 Feb 1988',
      temperament: 'Plays nice with other dogs',
      notes: 'Allergic to peanuts'
    )
  end

  it "Has a name" do
    expect(@scooby.name).to eq("Scooby Doo")
  end

  it "Has a breed" do
    expect(@dog.breed).to eq('Poodle')
  end

  it "Has a birthday" do
    expect(@dog.birthday).to eq('9 Feb 1988')
  end

  it "Has a temperament" do
    expect(@dog.temperament).to eq('Plays nice with other dogs')
  end

  it 'Has notes' do
    expect(@dog.notes).to eq('Allergic to peanuts')
  end
  
  it "Belongs to an Owner" do
    expect(@scooby.owner).to eq @shaggy
  end

  it "Has many walks" do
    2.times{ @scooby.walks << Walk.create() }
    expect(@scooby.walks.size).to eq(2)
  end
end
