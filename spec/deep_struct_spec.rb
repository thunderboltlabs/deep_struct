require 'spec_helper'

describe DeepStruct do
  context "instance with an array of hashes" do
    let :deep_struct do
      DeepStruct.from_data([{one:     1, foo: "bar"}, 
                            {"two" => 2, foo: "bar"}])
    end

    subject { deep_struct }

    its("first.one")     { should == 1   }
    its("second.two")    { should == 2   }
    its("first.unknown") { should == nil }

    describe "#each" do
      let :result do
        r = []; deep_struct.each { |h| r << h }; r
      end

      it "actually iterates on each element" do
        result.should_not be_empty
      end

      it "returns each element as a DeepStruct::Hash" do
        result.each {|e| e.should be_a(DeepStruct::Hash) }
      end
    end

    describe "#map" do
      let :result do
        deep_struct.map { |h| h }
      end

      it { should be_a(DeepStruct::Array) }

      it "returns each element as a DeepStruct::Hash" do
        result.each {|e| e.should be_a(DeepStruct::Hash) }
      end
    end

    describe "#sample" do
      subject { deep_struct.sample }
      its(:foo) { should == "bar" }
    end
  end

  context "instance with a hash of arrays of hashes" do
    let :deep_struct do
      DeepStruct.from_data(one: [{two: [[three: 3]]}])
    end

    subject { deep_struct }

    its("one.first.two.first.first.three") { should == 3 }
  end

  describe ".from_file with JSON file" do
    let :deep_struct do
      DeepStruct.from_file(fixture_file_path("data.json"))
    end
    subject { deep_struct }

    it "reads the file" do
      deep_struct.foo.should == "bar"
    end
  end

  describe ".from_file with Yaml file" do
    let :deep_struct do
      DeepStruct.from_file(fixture_file_path("data.yaml"))
    end
    subject { deep_struct }

    it "reads the file" do
      deep_struct.biz.should == "baz"
    end
  end

  describe ".from_file with Yaml file and short extension" do
    let :deep_struct do
      DeepStruct.from_file(fixture_file_path("data.yml"))
    end
    subject { deep_struct }

    it "reads the file" do
      deep_struct.hey.should == "there"
    end
  end

  describe ".from_file with unknown file" do
    it "explodes" do
      lambda do
        DeepStruct.from_file("unknown.asdf")
      end.should raise_error(DeepStruct::FileReader::UnknownFileFormat)
    end
  end

  describe ".from_file with blank file extension" do
    it "explodes" do
      lambda do
        DeepStruct.from_file("unknown")
      end.should raise_error(DeepStruct::FileReader::UnknownFileFormat)
    end
  end
end


