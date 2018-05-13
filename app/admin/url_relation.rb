# frozen_string_literal: true

ActiveAdmin.register UrlRelation do
  permit_params :input_url

  index do
    selectable_column
    id_column
    column :input_url
    column :created_at
    actions
  end

  filter :input_url
  filter :created_at

  form do |f|
    f.inputs do
      f.input :input_url
    end
    f.actions
  end
end
