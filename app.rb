require 'rubygems'
require 'sinatra'

configure do
  require 'memcached'
  CACHE = Memcached.new(ENV["MEMCACHE_SERVERS"])
  CACHE.set("hello", "hello world")
end

get "/" do
  CACHE.get("hello")
end