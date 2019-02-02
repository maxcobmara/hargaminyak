class Setup < ActiveRecord::Migration[5.1]
  def change
    create_table :entities do |t|
      t.string   :name
      t.string   :description
    end

    create_table :prices do |t|
      t.references  :entity
      t.string      :entity_name
      t.date        :price_on
      t.integer     :price
      t.text        :data
    end

  end
end
