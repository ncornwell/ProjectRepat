class DataFile < ActiveRecord::Base
  def self.save(upload, filename)
    directory = "/public/images/products/"
    # create the file path
    path = File.join(Rails.root, directory, filename)
    # write the file
    File.open(path, "wb") { |f| f.write(upload.read) }
  end
end
