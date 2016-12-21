ActiveAdmin.register Review do

  permit_params :rating, :restaurant_id, :user_id

  index do
    selectable_column
    id_column
    column :rating
    column :restaurant
    actions
  end

  filter :rating
  filter :restaurant

  form do |f|
    f.inputs "Restaurant Details" do
      f.input :rating
      f.input :restaurant
    end
    f.actions
  end

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end


end
