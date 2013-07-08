helpers do
  class Array
    def stale?
      times = self.map(&:time)
      DateTime.now > DateTime.parse((times.first + 900).to_s)
    end
  end
end