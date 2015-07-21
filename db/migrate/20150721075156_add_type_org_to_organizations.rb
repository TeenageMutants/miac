class AddTypeOrgToOrganizations < ActiveRecord::Migration
  def change
    add_column :organizations, :type_org_id, :integer
    add_column :organizations, :full_name, :string
    add_column :organizations, :tag_ids, :string
    add_column :organizations, :lsd_id, :string
    add_column :organizations, :web_site, :string
  end
end
