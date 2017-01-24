ActiveAdmin.register Ip do
  menu :parent => "User Management"
  config.comments = false
  actions :index

  index do
    selectable_column
    column :ipaddress
    column :created_at
    actions
  end

  filter :ipaddress
end