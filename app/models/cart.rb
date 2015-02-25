class Cart < ActiveRecord::Base

	has_many :lineitems, :dependent => :destroy
end
