class Nation 
  attr_reader :name,
              :allies, 
              :enemies,
              :affiliations

  def initialize(attributes)
    @name =  attributes[:name]
    @allies =  attributes[:allies]
    @enemies =  attributes[:enemies]
    @affiliations =  attributes[:affiliation]
  end

  def display_allies
    allies.present? ? allies.join(", ") : "None"
  end

  def display_enemies
    enemies.present? ? enemies.join(", ") : "None"
  end

  def display_affiliations
    affiliations.present? ? affiliations : "None"
  end

  def self.fire_nation_members_count(members)
    members.count { |member| member.affiliations.include?("Fire Nation") }
  end
end