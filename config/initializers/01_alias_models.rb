Restaurant = Mygem::Restaurant
Review = Mygem::Review
User = Mygem::User
AdminComment = Mygem::AdminComment
Quiz = Mygem::Quiz
Computer = Mygem::Computer
Gk = Mygem::Gk
Score = Mygem::Score
Project = Mygem::Project
Task = Mygem::Task
Ip = Mygem::Ip
EmployeeRole = Mygem::EmployeeRole
Contact = Mygem::Contact
[
  Restaurant,
  Review,
  User,
  AdminComment,
  Quiz,
  Computer,
  Gk,
  Score,
  Project,
  Task,
  Ip,
  EmployeeRole,
  Contact
].each do |klass|
  klass.instance_eval do
    def to_s
      super.demodulize
    end

    def name
      super.demodulize
    end
  end
end