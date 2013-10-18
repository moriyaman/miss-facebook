uri = URI.parse("redis://redistogo:6f8f429dc6aa98ea60f7aff46015329c@beardfish.redistogo.com:10553/" || "redis://localhost:6379/" )
REDIS = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password)
