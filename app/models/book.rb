class Book < ApplicationRecord
    enum status: [:Prestado, :Disponible]
end
