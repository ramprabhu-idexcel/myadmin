ActiveAdmin.register Restaurant do
  permit_params :name, :branch, :address, :phone_no, :city

  index do
    selectable_column
    column :name
    column :branch
    column :address
    column :phone_no
    column :city
    actions
  end

  filter :name
  filter :branch
  filter :address
  filter :phone_no
  filter :city


  form do |f|
    f.inputs "Restaurant Details" do
      f.input :name
      f.input :branch
      f.input :address
      f.input :phone_no
      f.input :city
    end
    f.actions
  end
end
