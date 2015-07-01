class Unit
attr_accessor :health_points, :attack_power, :damage

  def initialize(hp, ap)
    @health_points=hp
    @attack_power=ap
  end

  def attack!(enemy)
    if !self.dead?
      enemy.damage(attack_power)
  end
end

  def damage(attack_power)
    if !self.dead?
    @health_points -= attack_power
  end
end

  def dead?
    @health_points<=0
  end
end