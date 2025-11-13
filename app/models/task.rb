class Task < ApplicationRecord
  # --- ASSOCIATIONS (Active Record) ---
  # Project
  belongs_to :project
  # Assignee
  belongs_to :assignee, polymorphic: true, optional: true
  # Activity
  has_many :activities, as: :record, dependent: :destroy

  # --- SCOPES ---
  # Returns tasks with a 'complete' status
  scope :completed, -> { where(status: "completed") }

  # Returns tasks created within the last 7 days
  scope :recent, -> { where("created_at >= ?", 7.day.ago) }

  # Returns tasks assigned to a specific user
  scope :assigned_to, ->(user) { where(assignee: user) }
end
