class Task < ApplicationRecord
  # --- ASSOCIATIONS (Active Record) ---
  # Project
  belongs_to :project
  # Assignee
  belongs_to :assignee, polymorphic: true, optional: true
  # Activity
  has_many :activities, as: :record, dependent: :destroy
end
