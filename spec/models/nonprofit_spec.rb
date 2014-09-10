require 'rails_helper'

describe Nonprofit do
  it { should have_many :donations }
  it { should have_many :users }
end
