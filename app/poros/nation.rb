class Nation 
  attr_reader :name,
              :allies, 
              :enemies,
              :affiliations

  def initialize(attributes)
    @name =  attributes[:name],
    @allies =  attributes[:allies],
    @enemies =  attributes[:enemies]
    @affiliations =  attributes[:affiliation]
  end
end