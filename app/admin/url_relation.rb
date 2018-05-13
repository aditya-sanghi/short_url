# frozen_string_literal: true

ActiveAdmin.register UrlRelation do
  permit_params :short_version, :full_version

  index do
    selectable_column
    id_column
    column :short_version
    column :full_version
    column :created_at
    actions
  end

  filter :short_version
  filter :full_version
  filter :created_at

  form do |f|
    f.inputs do
      f.input :short_version
      f.input :full_version
    end
    f.actions
  end
end
