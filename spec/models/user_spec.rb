require 'spec_helper'

describe User do

  it { should have_many(:characters) }

  it 'should have at least one character' do
    create(:user, :characters => [build(:char1), build(:char2)]).should be_valid
  end

  it 'should have user name' do
    build(:user, user_name: '').should_not be_valid
  end

  #it 'should have realm' do
  #  build(:user, realm: "").should_not be_valid
  #end
end