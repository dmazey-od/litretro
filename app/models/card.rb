class Card < ApplicationRecord
  belongs_to :column
  belongs_to :user

  after_update_commit lambda {
    broadcast_replace_to "card_#{id}",
      partial: '/cards/votes',
      locals: { votes: votes }
  }
end
