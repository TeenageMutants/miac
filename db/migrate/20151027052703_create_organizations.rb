class CreateOrganizations < ActiveRecord::Migration
  def change
		create_table :organizations do |t|
			t.string  :address, nil: false
	    t.integer :city_id, nil: false
	    t.string  :name, nil: false
	    t.text    :description
	    t.string  :logo
	    t.string  :tel_secretary
	    t.string  :fax
	    t.string  :city_code, nil: false
	    t.integer :key
	    t.integer :type_org_id
	    t.string  :full_name
	    t.string  :tag_ids
	    t.string  :lsd_id
	    t.string  :web_site
		end
  end
end
