class Piece
	def Piece(ownerID)
		@ownerID = ownerID
	end

	def getOwner()
		return @ownerID
	end

end

#a = Piece.new
#a.Piece(1)
#puts(a.getOwner())
#puts"hello world"