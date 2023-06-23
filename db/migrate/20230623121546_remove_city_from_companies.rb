class RemoveCityFromCompanies < ActiveRecord::Migration[7.0]
  def change
    remove_column :companies, :city
  end
end
