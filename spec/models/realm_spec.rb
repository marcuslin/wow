require 'spec_helper'

describe Realm do
  it { should belong_to(:user) }

  it { should belong_to(:character)}
end