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