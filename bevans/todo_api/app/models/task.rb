class Task < ActiveRecord::Base
  validates :body, presence: true,
                    length: { minimum: 5 }
end
