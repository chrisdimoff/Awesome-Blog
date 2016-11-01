class RemoveReferenceComments < ActiveRecord::Migration[5.0]
  def change
    remove_reference :comments, :posts, index: true
  end
end
