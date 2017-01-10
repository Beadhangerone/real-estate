class Estate < ApplicationRecord
	scope :state, -> (state) { where state: state }
	scope :region, -> (region) { where region: region }
	scope :bedrooms, -> (bedrooms) { where bedrooms: bedrooms }

end
