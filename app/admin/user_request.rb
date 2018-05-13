ActiveAdmin.register UserRequest do
  permit_params :ip, :platform_name, :platform_version, :browser_name, :browser_version, :url_relation, :url_relation_id

  index do
    selectable_column
    id_column
    column :url_relation
    column :ip
    column :platform_name
    column :platform_version
    column :browser_name
    column :browser_version
    column :created_at
    actions
  end

  filter :platform_name
  filter :platform_version
  filter :browser_name
  filter :browser_version
  filter :created_at

  form do |f|
    f.inputs do
      f.input :platform_name
      f.input :platform_version
      f.input :browser_name
      f.input :browser_version
      f.input :url_relation
      f.input :ip
    end
    f.actions
  end

end
