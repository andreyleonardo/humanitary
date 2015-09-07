class Group < ActiveRecord::Base
  validates :group_name, :group_description, :responsable_name, :group_phone, :group_description, presence: true
  has_many :addresses
  accepts_nested_attributes_for :addresses
  
  include ActiveModel::Transitions
  state_machine initial: :received, auto_scopes: true do
    state :received
    state :processing
    state :approved
    state :not_approved

    event :analize do
      transitions to: :processing, from: :received
    end

    event :approve do
      transitions to: :approved, from: :processing
    end

    event :disapprove do
      transitions to: :deprecated, from: :processing
    end
  end
end
