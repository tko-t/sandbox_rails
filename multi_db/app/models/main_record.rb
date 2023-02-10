class MainRecord < ApplicationRecord
  self.abstract_class = true

  connects_to database: { writing: :main }
end
