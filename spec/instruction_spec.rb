require('spec_helper')

describe(Instruction) do
  it { should have_and_belong_to_many(:recipes) }
end
