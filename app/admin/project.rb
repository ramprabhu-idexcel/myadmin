ActiveAdmin.register Project do
  menu :parent => "Project Management"
  permit_params :title
  config.comments = false

  # index page
  index do
    selectable_column
    column :title
    actions
  end

  # show page
  show :title => :title do
    panel "Tasks" do
      table_for project.tasks do |t|
        t.column("Status") { |task| status_tag (task.is_done ? "Done" : "Pending"), (task.is_done ? :ok : :error) }
        t.column("Title") { |task| link_to task.title, admin_task_path(task) }
        t.column("Assigned To") { |task| task.user.email }
        t.column("Due Date") { |task| task.due_date? ? l(task.due_date, :format => :long) : '-' }
      end
    end
  end

  # Filter only by title
  filter :title
end
