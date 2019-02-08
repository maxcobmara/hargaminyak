class Price < ApplicationRecord

  belongs_to :entity
  before_save :set_entity_name

  default_scope {order(price_on: :desc)}

  def set_entity_name
    self.entity_name = Entity.find(entity_id).name
  end


end
