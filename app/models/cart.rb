class Cart < ApplicationRecord
    belongs_to :user
  
    enum status: { in_progress: 0, completed: 1 }
  end