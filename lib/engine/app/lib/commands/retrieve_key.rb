class RetrieveKey < Struct.new(:backend, :key)
  def result
    backend.get(key)
  end
end