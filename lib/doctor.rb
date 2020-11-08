class Doctor
    attr_accessor :name
    @@all = []
    def self.all
        @@all
    end

    def initialize(name)
        @name = name
        @@all << self
    end

    def new_appointment(date, patient)
        Appointment.new(date, patient, self)
    end

    def appointments
        Appointment.all.select {|i| i.doctor == self}
    end

    def patients
        patients = []
        appointments.each do |appointment|
            patients << appointment.patient
        end
        patients
    end
end