require 'json'
# A utility class for saving and loading data from JSON files.
class Storage
  # list_of_objects =

  def self.save_data(filename, data)
    File.write(filename, JSON.generate(data))
  end

  def self.load_data(filename)
    return [] unless File.exist?(filename)

    # return [] unless filename.empty?

    data = File.read(filename)
    JSON.parse(data, create_additions: true)
  end
end
