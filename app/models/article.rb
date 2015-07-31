class Article < ActiveRecord::Base
	belongs_to :user
	has_many :comments

	validates :title, {presence: true}
	validates :body, {presence: true,length: {minimum:20}}

	has_attached_file :cover, styles: { medium: "1280x720", thumb: "800x600" }
  	validates_attachment_content_type :cover, content_type: /\Aimage\/.*\Z/
  	

end