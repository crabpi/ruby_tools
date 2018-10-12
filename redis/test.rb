require "redis"
redis = Redis.new
redis.set("test", "hello world")
puts redis.get("test")