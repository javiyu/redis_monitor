class ChangeDatabase < Struct.new(:backend, :database)
  def execute
    backend.select(database)
    backend.current_database = database
  end
end