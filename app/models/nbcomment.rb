class Nbcomment < ActiveRecord::Base
	belongs_to :user
	belongs_to :nova_bulletin
end
