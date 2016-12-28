ActiveAdmin.register Quiz do
  config.comments = false

  permit_params :question, :answer, :type, :option

  index do
    selectable_column
    column :question
    column :answer
    column :type
    column :option
    actions
  end

  filter :question
  filter :answer
  filter :type
  filter :option


  form do |f|
    f.inputs "Quiz Details" do
      f.input :type, :label => 'Type', :as => :select, :collection => ["Computer", "Gk"], include_blank: false
      f.input :question
      f.input :answer
      f.input :option, :label => 'Select Option', :as => :select, :collection => ["A", "B", "C", "D"], include_blank: false
    end
    f.actions
  end
end
