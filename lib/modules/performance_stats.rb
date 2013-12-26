require 'benchmark'

class PerformanceStats < Struct.new(:backend)

  GET_ACCESS_TIMES = 10_000
  SET_ACCESS_TIMES = 10_000
  CREATE_AND_DELETE_ACCESS_TIMES = 10_000

  def average_access
    key = generate_key
    backend.set(key, rand)

    time = Benchmark.measure{ GET_ACCESS_TIMES.times{ backend.get(key) } }
    backend.del(key)

    time.real / GET_ACCESS_TIMES
  end

  def average_write
    key = generate_key
    time = Benchmark.measure{ SET_ACCESS_TIMES.times{ backend.set(key, rand) } }
    backend.del(key)

    time.real / SET_ACCESS_TIMES
  end

  def average_create_and_delete
    key = generate_key
    time = Benchmark.measure do
      CREATE_AND_DELETE_ACCESS_TIMES.times do
        backend.set(key, rand)
        backend.del(key)
      end
    end

    time.real / CREATE_AND_DELETE_ACCESS_TIMES
  end

  def results
    { average_access: format_result_in_ms(average_access),
      average_write: format_result_in_ms(average_write),
      average_create_and_delete: format_result_in_ms(average_create_and_delete)}
  end

  private
  def generate_key
    rand.to_s
  end

  def format_result_in_ms(result)
    "#{format('%.3f', result.to_f * 1000)} ms"
  end
end
