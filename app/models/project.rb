class Project < ApplicationRecord
  # --- ASSOCIATIONS (Active Record) ---
  # Tasks
  has_many :tasks, dependent: :destroy
end
