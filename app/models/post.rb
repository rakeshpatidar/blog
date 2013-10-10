class Post < ActiveRecord::Base
 belongs_to :member
 has_many :comments
 validates :title, presence: true,
                    length: { minimum: 5 }
end
