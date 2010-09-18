require 'rubygems'
require 'sinatra'
require 'memcache-client'

configure do
  require 'memcached'
  CACHE = Memcached.new
  CACHE.set("hello", "hello world")
end

get "/" do
  CACHE.get("hello")
end