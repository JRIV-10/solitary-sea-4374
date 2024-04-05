require 'rails_helper'

RSpec.describe Nation do
  describe '#initialize' do
    it 'creates a new nation object with attributes' do
      attributes = { name: 'Fire Nation', allies: ['A'], enemies: ['B'], affiliation: 'C' }
      nation = Nation.new(attributes)
      
      expect(nation.name).to eq('Fire Nation')
      expect(nation.allies).to eq(['A'])
      expect(nation.enemies).to eq(['B'])
      expect(nation.affiliations).to eq('C')
    end
  end
  
  describe '#display_allies' do
    it 'returns allies as a string separated by commas' do
      nation = Nation.new(allies: ['A', 'B', 'C'])
      expect(nation.display_allies).to eq('A, B, C')
    end
    
    it 'returns "None" if there are no allies' do
      nation = Nation.new(allies: [])
      expect(nation.display_allies).to eq('None')
    end
  end
  
  describe '#display_enemies' do
    it 'returns enemies as a string separated by commas' do
      nation = Nation.new(enemies: ['X', 'Y', 'Z'])
      expect(nation.display_enemies).to eq('X, Y, Z')
    end
    
    it 'returns "None" if there are no enemies' do
      nation = Nation.new(enemies: [])
      expect(nation.display_enemies).to eq('None')
    end
  end
  
  describe '#display_affiliations' do
    it 'returns affiliations as is' do
      nation = Nation.new(affiliation: 'Some affiliation')
      expect(nation.display_affiliations).to eq('Some affiliation')
    end
    
    it 'returns "None" if there are no affiliations' do
      nation = Nation.new(affiliation: nil)
      expect(nation.display_affiliations).to eq('None')
    end
  end
  
  describe '.fire_nation_members_count' do
    it 'returns the count of members affiliated with the Fire Nation' do
      members = [
        Nation.new(affiliation: 'Fire Nation'),
        Nation.new(affiliation: 'Earth Nation'),
        Nation.new(affiliation: 'Fire Nation'),
        Nation.new(affiliation: 'Water Nation')
      ]
      
      expect(Nation.fire_nation_members_count(members)).to eq(2)
    end
  end
end