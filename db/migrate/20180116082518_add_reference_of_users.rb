class AddReferenceOfUsers < ActiveRecord::Migration[5.0]
  def change
    add_reference :offices, :user, index: true
    add_reference :reviews, :user, index: true
  end
end
