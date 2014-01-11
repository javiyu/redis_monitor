class RemoveKey < Struct.new(:backend, :key)
  def execute
    Authorization.execute_if_authorized_for(:remove_content) do
      backend.del(key)
    end
  end
end