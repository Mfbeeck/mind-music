class AddSourceUrlToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :sourceurl, :string
  end
end
