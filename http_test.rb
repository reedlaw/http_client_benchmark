require 'http'
require 'connection_pool'
require 'memory_profiler'

class MemoryTest
  URL = 'http://example.com'.freeze
  CONCURRENT_REQUESTS = 20

  def initialize(requests_count)
    @requests_count = requests_count
  end

  def run
    pool = ConnectionPool.new(size: CONCURRENT_REQUESTS, timeout: 5) do
      HTTP.persistent(URL)
    end

    pool.with { |conn| conn.get('/').to_s }
  end
end

# warmup
MemoryTest.new(5).run

GC.start

# run tests
MemoryProfiler.report do
  MemoryTest.new(10).run
end.pretty_print(to_file: 'reports/http_mem_report_10')

GC.start

MemoryProfiler.report do
  MemoryTest.new(100).run
end.pretty_print(to_file: 'reports/http_mem_report_100')
