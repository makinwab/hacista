class RenameConfirmPasswordToPasswordConfirmation < ActiveRecord::Migration
  def change
    rename_column :users, :confirm_password, :password_digest
  end
end
