class AddBios < ActiveRecord::Migration
	def up
		add_column :politicians, :bio, :string
	end

	def down
		remove_column :politicians, :bio
	end
end