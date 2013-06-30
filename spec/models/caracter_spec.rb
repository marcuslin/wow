require 'spec_helper'

describe Character do

  it { should belong_to(:user) }

  it { should have_many(:equipments).through(:character_equips) }

  #it 'should have character name' do
  #  build(:char1, name: "").should_not be_valid
  #end

end