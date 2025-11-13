class Activity < ApplicationRecord
  # --- ASSOCIATIONS (Active Record) ---
  # Actor
  belongs_to :actor, polymorphic: true, optional: true
  # Record
  belongs_to :record, polymorphic: true
end
