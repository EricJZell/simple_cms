class Subject < ActiveRecord::Base
  has_many :pages

  acts_as_list

  # Don't need to validate (in most cases):
  # ids, foreign keys, timestamps, booleans, counters
  validates_presence_of :name
  validates_length_of :name, maximum: 255
  # validates_presence_of vs validates_length_of minimum: 1
  # different error messages
  # length_of accepts spaces as characters, so it can still be blank!


  scope :visible, lambda { where(:visible => true) }
  scope :invisible, lambda { where(:visible => false) }
  scope :sorted, lambda { order("subjects.position ASC") }
  scope :newest_first, lambda { order("subjects.created_at DESC") }
  scope :search, lambda { |query|
    where(["name ILIKE ?", "%#{query}%"])
  }

end
