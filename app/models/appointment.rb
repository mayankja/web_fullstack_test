class Appointment < ApplicationRecord
	mount_uploaders :photos, PhotoUploader
end