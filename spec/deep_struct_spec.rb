require 'spec_helper'

describe DeepStruct do
  context "with an array of hashes" do
    let :deep_struct do
      DeepStruct.from_data([{:one  => 1}, {"two" => 2}])
    end

    subject { deep_struct }

    its("first.one")  { should == 1 }
    its("second.two") { should == 2 }
  end

  context "with a hash of arrays of hashes" do
    let :deep_struct do
      DeepStruct.from_data(one: [{two: [[three: 3]]}])
    end

    subject { deep_struct }

    its("one.first.two.first.first.three") { should == 3 }
  end

  describe "from_file" do
    it "reads the file and does stuff"
  end
end
