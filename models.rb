class Project < ActiveRecord::Base
  validates :name, presence: true
  has_many :choices
end

class Choice < ActiveRecord::Base
  validates :description, presence: true
  belongs_to :project
  has_many :classifications
end

class Observation < ActiveRecord::Base
  validates :text_data, presence: true
  belongs_to :project
  has_one :classification
  
  def self.next_to_classify(project_id: )
    self.includes(:classification).where(:project_id => project_id ).where( :classifications => { :observation_id => nil } ).first
  end
end

class Classification < ActiveRecord::Base
  belongs_to :observation
  belongs_to :choice
  validates :choice, :presence => true
  validates :observation, :presence => true
end
