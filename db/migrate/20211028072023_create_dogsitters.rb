class CreateDogsitters < ActiveRecord::Migration[5.2]
  def change
    create_table :dogsitters do |t|
      t.string :name
      has_many :dogs, through: :troll
      t.belongs_to :city_name
      
      t.timestamps
    end
  end
end
