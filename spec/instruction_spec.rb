require 'spec_helper'

describe Instruction do

  it('ensures length of description is more then 15 characters') do
    instruction = Instruction.new(description: "a")
    expect(instruction.save).to(eq(false))
  end
end
