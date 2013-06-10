require 'spec_helper'

describe Character do

  it { should have_many(:users).through(:realms) }

  it { should have_many(:equipments).through(:character_equips) }
  #it 'should have at least one character' do
  #  create(:user, :characters => [build(:char1), build(:char2)]).should be_valid
  #end
end