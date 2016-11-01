class CreateContacts < ActiveRecord::Migration[5.0]
  def change
    create_table :contacts do |t|
      t.string :subject
      t.text :message
      t.text :email
      t.string :name

      t.timestamps
    end
  end
end
