class CreateDogs < ActiveRecord::Migration[5.2]
  def change
    create_table :dogs do |t|
      t.string :name
      has_many :dogsitters, through: :troll
      t.belongs_to :city_name
      
      t.timestamps
    end
  end
end
