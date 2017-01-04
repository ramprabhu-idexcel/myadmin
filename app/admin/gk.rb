ActiveAdmin.register Gk do
  menu :parent => "Online Quiz"

  config.comments = false

  permit_params :question, :answer, :type, :options

  index title: "GK Quiz" do
    selectable_column
    column :question
    column :options
    column :answer
    actions
  end

  filter :question
  filter :answer


  form do |f|
    f.inputs "Quiz Details" do
      f.input :question
      f.input :options
      f.input :answer
    end
    f.actions
  end

  before_filter :set_options, only: [:create, :update]

  controller do
    def set_options
      params["gk"]["options"] = params["gk"]["options"].split(",")
    end

    def permitted_params
      params.permit!
    end
  end
end
