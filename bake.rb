require 'benchmark/ips'
require 'oj'
# require 'oj/json'
require 'yajl'
require 'json'
require 'fast_jsonparser'

FILENAME = 'tweet.json'.freeze

def benchmark_load
	json = File.read(FILENAME)
	
	Benchmark.ips do |x|
		x.report('yajl parser') do
			Yajl::Parser.parse(json)
		end
		
		x.report('oj parser') do
			Oj.load(json)
		end
		
		x.report('simdjson parser') do
			FastJsonparser.parse(json)
		end
		
		x.report('json parser') do
			JSON.parse(json)
		end
		
		x.compare!
	end
end

def benchmark_dump
	json = File.read(FILENAME)
	object = JSON.parse(json)
	
	File.write("yajl_encode.json", Yajl::Encoder.encode(object))
	File.write("oj_dump.json", Oj.dump(object))
	File.write("json_generate.json", JSON.generate(object))
	File.write("json_dump.json", JSON.dump(object))
	File.write("json_fast_generate.json", JSON.fast_generate(object))
	
	Benchmark.ips do |x|
		x.report('yajl encode') do
			Yajl::Encoder.encode(object)
		end
		
		x.report('oj dump') do
			Oj.dump(object)
		end
		
		x.report('json generate') do
			JSON.generate(object)
		end
		
		x.report('json dump') do
			JSON.dump(object)
		end
		
		x.report('json fast_generate') do
			JSON.fast_generate(object)
		end
		
		x.compare!
	end
end
