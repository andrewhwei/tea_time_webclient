class Tea

  attr_accessor :id, :name, :origin, :weight, :in_stock

  def initialize(hash)
    @id = hash["id"]
    @name = hash["name"]
    @origin = hash["origin"]
    @weight = hash["weight"]
    @in_stock = hash["in_stock"]
  end

end