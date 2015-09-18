class AddCountClicksToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :countclicks, :integer
  end
end
