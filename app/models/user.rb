class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :lists

  #nombre
  validates :nombre, presence: true
  #apellido
  validates :apellido, presence: true
  #email
  validates :email, presence: true
  validates :email, uniqueness: true
  #foto
  validates :foto, :format => URI::regexp(%w(http https)), :allow_blank => true
  #idiomasNativos
  validates :idiomasNativos, presence: true
  #idiomasAAprender
  validates :idiomasAAprender, presence: true
end
