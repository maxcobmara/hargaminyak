class Price < ApplicationRecord

  belongs_to :entity
  before_save :set_entity_name

  default_scope {order(price_on: :desc)}

  scope :kuning, -> {where(entity_name: "RON95")}
  scope :hijau, -> {where(entity_name: "RON97")}
  scope :hitam, -> {where(entity_name: "Diesel")}
  scope :biru, -> {where(entity_name: "Diesel Euro5")}
  scope :blaze, -> {where(entity_name: "RON100")}
  scope :merah, -> {where(entity_name: "VPower")}

  def set_entity_name
    self.entity_name = Entity.find(entity_id).name
  end




end
