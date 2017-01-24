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
  Task
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
