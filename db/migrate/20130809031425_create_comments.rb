class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :article
      t.string :author_name
      t.text :body

      t.timestamps
    end
  end
end
