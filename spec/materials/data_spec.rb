require "spec_helper"

RSpec.describe Materials::Data do
  it "has a version number" do
    expect(Materials::Data::VERSION).not_to be nil
  end

  it "does something useful" do
    expect(false).to eq(true)
  end
end
