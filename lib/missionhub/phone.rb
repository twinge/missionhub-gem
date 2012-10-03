module MissionHub
  class Person
    class Phone
      attr_accessor :number, :location, :primary

      def after_initialize
        @primary = 0
        @location = "mobile"
      end

      def number=(number)
        @number = number.gsub(/[^0-9]/, "")
      end

      def hash
        hash_to_return = {}
        self.instance_variables.each do |var|
          hash_to_return[var.to_s.gsub("@","")] = self.instance_variable_get(var)
        end
        hash_to_return
      end
    end
  end
end
