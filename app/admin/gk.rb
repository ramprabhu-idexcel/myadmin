ActiveAdmin.register Gk do
  menu :parent => "Online Quiz"

  config.comments = false

  permit_params :question, :answer, :type, :option

  index title: "GK Quiz" do
    selectable_column
    column :question
    column :answer
    column :option
    actions
  end

  filter :question
  filter :answer
  filter :option


  form do |f|
    f.inputs "Quiz Details" do
      f.input :question
      f.input :answer
      f.input :option, :label => 'Select Option', :as => :select, :collection => ["A", "B", "C", "D"], include_blank: false
    end
    f.actions
  end
end
