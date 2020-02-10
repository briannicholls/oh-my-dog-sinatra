require 'spec_helper'

describe "User" do
  before do
    @user = User.create(first_name: 'Leo')
  end

  it 'Has an id' do
    expect(@user.id).to eq User.all.last.id
  end

  it "Has a name" do
    expect(@user.first_name).to eq("Leo")
  end

  it "Has many walks" do
    @user.walks << Walk.create
    expect(@user.walks.size).to eq(1)
  end


end
