require 'spec_helper'

describe Equipment do

  it { should have_many(:characters).through(:character_equips) }

  it 'should only have one equipment' do
    create(:equip1, :characters => [build(:char1), build(:char2)]).should be_valid
    Equipment.all.count.should == 1
  end
end