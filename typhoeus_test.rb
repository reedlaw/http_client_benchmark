require 'typhoeus'
require 'memory_profiler'
Typhoeus::Config.memoize = false

class MemoryTest
  URL = 'http://example.com'.freeze
  CONCURRENT_REQUESTS = 20

  def initialize(requests_count)
    @requests_count = requests_count
  end

  def run
    hydra = Typhoeus::Hydra.new(max_concurrency: CONCURRENT_REQUESTS)
    @requests_count.times do
      request = Typhoeus::Request.new(URL, method: :get)
      hydra.queue(request)
    end
    hydra.run
  end
end

# warmup
MemoryTest.new(5).run

GC.start

# run tests
MemoryProfiler.report do
  MemoryTest.new(10).run
end.pretty_print(to_file: 'reports/mem_report_10')

GC.start

MemoryProfiler.report do
  MemoryTest.new(100).run
end.pretty_print(to_file: 'reports/mem_report_100')
