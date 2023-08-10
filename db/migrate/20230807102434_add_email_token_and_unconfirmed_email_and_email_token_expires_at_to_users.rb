class AddEmailTokenAndUnconfirmedEmailAndEmailTokenExpiresAtToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :email_token, :string, default: nil
    add_column :users, :unconfirmed_email, :string, default: nil
    add_column :users, :email_token_expires_at, :datetime, default: nil
  end
end
