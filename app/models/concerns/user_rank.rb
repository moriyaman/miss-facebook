module UserRank
  def self.setup
    User.find_each do |user|
      redis.zadd('ranking', user.score, user.id)
    end
  end
 
  # 現在の順位
  def rank
     UserRank.redis.zrevrank('ranking', self.id) + 1
  end
 
  # 現在のスコア（この例だとユーザの保持するポイント）
  def score
     UserRank.redis.zscore('ranking', self.id)
  end
 
  # スコアの更新
  def update_score(new_score)
     UserRank.redis.zincrby('ranking', new_score, self.id)
  end
 
  private
 
  def self.redis
    @redis ||= Redis.new
  end
end
