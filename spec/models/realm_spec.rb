require 'spec_helper'

describe Realm do
  it { should belong_to(:user) }

  it { should belong_to(:character)}

  it 'should heve realm name' do
    build(:realm, name: '').should_not be_valid
  end
end