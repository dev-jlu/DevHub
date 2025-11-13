class User < ApplicationRecord
  # --- ASSOCIATIONS (Active Record) ---
  # Assigned tasks
  has_many :assigned_tasks, as: :assignee, class_name: "Task", dependent: :nullify
  # Activity
  has_many :activities, as: :actor, dependent: :nullify
end
