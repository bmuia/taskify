class Task < ApplicationRecord
    #validations
    validates :title, presence: true, uniqueness: true
    validates :description, length: { minimum: 10}, uniqueness: true
end
