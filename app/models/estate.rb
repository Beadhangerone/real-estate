class Estate < ApplicationRecord
	scope :state, -> (state) { where state: state }
	scope :region, -> (region) { where region: region }
	scope :bedrooms, -> (bedrooms) { where bedrooms: bedrooms }
	scope :rent, -> (rent) { where rent: rent }
	scope :sale, -> (sale) { where sale: sale }

end
