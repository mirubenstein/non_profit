require 'rails_helper'

describe Donation do
  it { should belong_to :user }
  it { should belong_to :nonprofit }
end
