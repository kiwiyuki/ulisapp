class Event < ActiveRecord::Base
    has_many :participants, foreign_key: 'event_id', dependent: :delete_all
end
