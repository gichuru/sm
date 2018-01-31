class InitialSchema < ActiveRecord::Migration[5.0]
  def change
    create_table :sites do |t|
      t.string  :name
      t.text    :description
      t.string  :location
      t.string  :email
      t.integer :phone
      t.string :website
      t.string  :logo
      t.timestamps
    end

    create_table :spaces do |t|
      t.string  :type #Desk, office, boardroom, meeting room, field, restaurant
      t.integer :accomodate
      t.integer :qty
      t.text    :description
      t.string  :photos
      t.integer :price
      t.boolean :active
      t.timestamps
    end

    create_table :amenties do |t|
      t.string :name #internet, kitchen, parking, aircondition, projector
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
    #add_reference :sites, :city, index: true
    add_reference :spaces, :site, index: true
    add_reference :reviews, :space, index: true
    add_reference :amenties, :space, index: true
    add_reference :amenties, :site, index: true

  end
end
