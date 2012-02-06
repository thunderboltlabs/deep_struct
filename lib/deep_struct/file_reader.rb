class DeepStruct::FileReader
  class UnknownFileFormat < RuntimeError; end

  def initialize(path)
    @path = path
    @type = extract_type
    bad_type! unless @type
  end

  def data
    send("read_#{@type}_file")
  rescue NoMethodError
    bad_type!
  end

  private

  def bad_type!
    raise UnknownFileFormat.new(
      "Unsupported filetype (#{@type.inspect}) for #{@path}")
  end

  def extract_type
    @path.split(".").last.downcase
  end

  def contents
    File.read(@path)
  end

  def read_json_file
    JSON.load(contents)
  end

  def read_yaml_file
    YAML.load(contents)
  end
  alias read_yml_file read_yaml_file
end
