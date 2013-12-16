class Lesson < ActiveRecord::Base

    belongs_to :day
    belongs_to :plkst
    belongs_to :cabinet
    belongs_to :teaching_relation

    validates :day_id,               presence: true
    validates :plkst_id,             presence: true
    validates :cabinet_id,           presence: true
    validates :teaching_relation_id, presence: true

    #TODO cant update fields because of some validators

    #Makes sure foreign keys actually do reference some existing data in their home tables.
    validates_with FkExistLeValidator

    # Cabinet must be available at the given day and time
    validates :cabinet_id, uniqueness: {scope: [:day_id, :plkst_id], message: 'at the given day and time is not available' }

    # Teacher must be available at the given day and time. Stored in app/validators/teacher_available_validator.rb
    validates_with TeacherAvailableValidator

end
