class CreateCities < ActiveRecord::Migration[5.2]
  def change
    create_table :cities do |t|
      t.string :city_name
      has_many :dogsitter
      has_many :dog
      t.timestamps
    end
  end
end
