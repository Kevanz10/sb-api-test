class User < ApplicationRecord
	has_secure_password
	include TokenProvider
	has_many :scratchers
end
