class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  mount_uploader :avatar, ImageUploader

  validates :email, uniqueness: true
  validates :password, presence: true, on: :create

  attr_accessor :current_password

  enum sex: {
    unanswered: 0,
    male: 1,
    female: 2,
    not_applicable: 3
  }

  enum occupation: {
    unselected: 0,
    elementary_school_student: 1,
    middle_school_student: 2,
    high_school_student: 3,
    junior_college_or_professional_student: 4,
    univercity_student: 5,
    company_employeeor_civil_servant: 6,
    executive_or_self_employed: 7,
    house_maker: 8,
    part_timer: 9,
    unemployed: 10,
    other: 11
  }
end
