class UpdateAdminToUser < ActiveRecord::Migration[5.2]
  def change
    "thdweb@gmail.com".update_attribute :admin, true
  end
end
