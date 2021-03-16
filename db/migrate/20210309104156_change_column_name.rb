class ChangeColumnName < ActiveRecord::Migration[6.1]
  def change
    rename_column :articles, :txt, :text
  end
end
