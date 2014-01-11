class DatabaseList < Struct.new(:backend)
  def result
    backend.info.keys.map{|d| d.match(/db(\d+)/);$1}.compact
  end
end