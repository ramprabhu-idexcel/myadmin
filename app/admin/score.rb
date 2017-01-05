ActiveAdmin.register Score do
  menu :parent => "Online Quiz"
  config.comments = false

  permit_params :marks, :attempt, :user_id, :section

  actions :index

  index do
    selectable_column
    column :marks
    column :attempt
    column :user
    column :section
    actions
  end

  filter :marks
  filter :attempt
  filter :user
  filter :section
end