class User < ApplicationRecord
  extend Enumerize
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
 
  ROLES = %w[patient therapist admin].freeze
  enumerize :role, in: ROLES, default: ROLES.first, predicates: true, scope: true
  validates :role, inclusion: { in: ROLES }, presence: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :patients, dependent: :destroy
  has_many :therapists
end
