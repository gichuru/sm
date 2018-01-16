class InitialSchema < ActiveRecord::Migration[5.0]
  def change
    create_table :offices do |t|
      t.string  :name
      t.text    :description
      t.string  :location
      t.string  :email
      t.integer :phone
      t.string  :logo
      t.timestamps
    end

    create_table :spaces do |t|
      t.string  :type
      t.text    :description
      t.integer :capacity
      t.integer :qty
      t.string  :photo
      t.integer :price
      t.timestamps
    end

    create_table :reviews do |t|
      t.string  :text
      t.timestamps
    end

    create_table :cities do |t|
      t.string  :city
      t.timestamps
    end

    create_table :countries do |t|
      t.string  :country
      t.timestamps
    end

    add_reference :cities, :country, index: true
    add_reference :offices, :city, index: true
    add_reference :spaces, :office, index: true
    add_reference :reviews, :space, index: true
  end
end
