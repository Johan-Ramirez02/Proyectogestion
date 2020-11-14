class Project < ApplicationRecord

    validates :name, :description, presence: true
    enum status: %w[propuesta en_progreso terminada]

    #Antes de grabar que revise si esta status presente, si esta entonces 
    #status.save sino status = propuesta
    before_save :has_status

    def has_status
        if self.status.present?
            self.status.save
        else
            self.status = "propuesta"
        end
    end

end
