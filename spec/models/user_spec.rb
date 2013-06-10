require 'spec_helper'

describe User do

  it { should have_many(:characters).through(:realms) }

  it 'should have at least one character' do
    create(:user, :characters => [build(:char1), build(:char2)]).should be_valid
  end

end