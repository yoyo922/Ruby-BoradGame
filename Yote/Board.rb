load 'Piece.rb'

class Board
	def Board() 
		@board = Hash.new()
	end

	def addPiece(pieceToPlace, position)
		@board[position] = pieceToPlace
	end

	def isEmpty?(position)
		if position > -1 && position < 31
			#puts @board[position]
			if @board[position].nil?
				return true
			else
				return false
			end
		end
	end

	def movePiece(initialPosition, targetPosition)
		@board[targetPosition] = @board[initialPosition]
		@board.removePiece(initialPosition)
	end 

	def pieceOnBoard?(playerID)
		exist = false
		@board.each do |key, value|
		 	id = value.getOwner()
		 	if id == playerID
		 		exist = true
		 	end
		 end
		 return exist
	end

	def removePiece(position)
		@board.delete(position)
	end

	def getOwnerAtPosition(position)
		#@board[position].getOwner()
		return @board[position].getOwner()
		#return @piece
	end
end

#testBoard = Board.new
#testBoard.Board()
#testPiece = Piece.new
#testPiece.Piece(1)
#testBoard.addPiece(testPiece,6)
#testBoard.removePiece(6)
#puts(testBoard.getOwnerAtPosition(6))
#puts (testBoard.pieceOnBoard?(1))
#puts (testBoard.isEmpty?(6))
