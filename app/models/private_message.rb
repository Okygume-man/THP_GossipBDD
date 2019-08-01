class PrivateMessage < ApplicationRecord
	#Permet de différencier message recu et envoyé
	belongs_to :sender, class_name: "User"
  belongs_to :recipient, class_name: "User"
end
