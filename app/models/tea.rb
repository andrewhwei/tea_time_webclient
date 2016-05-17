class Tea

  attr_accessor :id, :name, :origin, :weight, :in_stock

  def initialize(hash)
    @id = hash["id"]
    @name = hash["name"]
    @origin = hash["origin"]
    @weight = hash["weight"]
    @in_stock = hash["in_stock"]
  end

  def self.find(id)
    tea_hash = Unirest.get("#{ENV['DOMAIN']}teas/#{id}.json").body
    return Tea.new(tea_hash)
  end

  def self.all
    array_of_tea_hashes = Unirest.get("#{ENV['DOMAIN']}teas.json").body
    return array_of_tea_hashes.map {|tea_hash| Tea.new(tea_hash)}
  end

end