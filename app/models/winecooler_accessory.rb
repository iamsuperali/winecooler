class WinecoolerAccessory < ActiveRecord::Base
  attr_accessible :accessory_id, :winecooler_id
  belongs_to :winecooler
  belongs_to :accessory
end
