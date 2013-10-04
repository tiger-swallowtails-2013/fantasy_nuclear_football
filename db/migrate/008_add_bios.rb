class AddBios < ActiveRecord::Migration
	def up
		add_column :politicians, :bio, :text
	end

	def down
		remove_column :politicians, :bio
	end
end