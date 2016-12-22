Restaurant = Mygem::Restaurant
Review = Mygem::Review
[
  Restaurant,
  Review
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
