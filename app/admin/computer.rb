ActiveAdmin.register Computer do
  menu :parent => "Online Quiz"

  config.comments = false

  permit_params :question, :answer, :type, :options

  index title: "Computer Quiz" do
    selectable_column
    column :question
    column "options" do |computer|
      computer.options.join(",")
    end
    column :answer
    actions
  end

  filter :question
  filter :answer


  form do |f|
    f.inputs "Quiz Details" do
      f.input :question
      f.input :options, input_html: { value: self.computer.options.join(",") }
      f.input :answer
    end
    f.actions
  end

  before_filter :set_options, only: [:create, :update]
  before_filter :set_computer, only: [:edit]

  controller do
    def set_options
      params["computer"]["options"] = params["computer"]["options"].split(",")
    end

    def set_computer

    end

    def permitted_params
      params.permit!
    end
  end
end
