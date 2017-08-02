class Section < ActiveRecord::Base
  has_many :section_edits
  belongs_to :page
  has_many :editors, through: :section_edits, class_name: "AdminUser"
end
