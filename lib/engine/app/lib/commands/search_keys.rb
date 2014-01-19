class SearchKeys < Struct.new(:backend, :key)
  def result
    backend.keys(key).map{|found| {key: found, value: backend.get(found)} }
  end
end