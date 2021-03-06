class Product < ActiveRecord::Base
  attr_accessible :brand, :category, :description, :name, :price

  # validate_presence_of :name, :price ;;; Sintaxis antigua
  validates :name, presence: true,
                    length: { minimum: 3}
  validates :price, presence: true,
                    numericality: true

  validates :category,  :allow_blank => true,
                    length: { :in => 4..20 }

  validate :validate_expensive_price, :validate_free_category_price_free

  before_save :fill_description

  def validate_expensive_price
  	if brand == "Apple" && price < 2300
  		errors[:base] << "Seguro que es imitacion" # error de todo el formulario
  		errors.add[:price] = "Esto es muy barato"             # marca el campo de error en rojo
  	end
  end

  def validate_free_category_price_free
  	if category == "Gratis" && price > 0
  		errors[:base] << "El precio debe ser cero"             # marca el campo de error en rojo
  	end
  end


  def fill_description
    if description.blank?
    	self.description = name
    end
  end

  has_many :reviews

  # has_many :reviews, :dependent => :destroy
  # has_many :reviews, :dependent => :nullify
  # has_many :reviews, :dependent => :ignore
  # has_many :reviews, :dependent => :restrict --> se niega a borrar hijos
  
end
