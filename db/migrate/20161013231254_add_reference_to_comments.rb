class AddReferenceToComments < ActiveRecord::Migration[5.0]
  def change
    add_reference :comments, :posts, index: true
  end
end
