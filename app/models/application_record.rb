class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  #Enables implicit order column for UUID
  self.implicit_order_column = "created_at"

  scope :all_desc, -> { all.order('created_at desc')}
  # Ex:- scope :active, -> {where(:active => true)}
end
