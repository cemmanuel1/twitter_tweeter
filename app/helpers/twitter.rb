helpers do
  class Array
    def stale?
      times = self.map(&:time).map(&:to_i)
      average_time = get_average(times)
      p DateTime.strptime((times.first+average_time).to_s, '%s')
      p DateTime.strptime(DateTime.now.to_i.to_s, '%s')
      DateTime.strptime(DateTime.now.to_i.to_s, '%s') > DateTime.strptime((times.first+average_time).to_s, '%s')
    end

    def get_average(times)
      differences = []

      times.each_with_index do |x, index|
        break if times[index+1] == nil
        differences << times[index] - times[index+1]
      end
      differences.inject(:+) / differences.length
    end
  end


end