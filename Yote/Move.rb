class Move
	def Move(oldPosition, newPosition, player, board)
		@oldPosition = oldPosition
		@newPosition = newPosition
		@player = player
		@board = board	
	end

	def isMoveValid()
		if (@newPosition < 1 || @newPosition > 30)
			puts ("\nEnter a number between 1-30!")
			return false
		end

		if (@oldPosition - @newPosition == 1 ||  @oldPosition - @newPosition == -1 || @oldPosition - @newPosition == 6 || @oldPosition - @newPosition == -6 )
			@type = "move"
		elsif (@oldPosition - @newPosition == 2 ||  @oldPosition - @newPosition == -2 || @oldPosition - @newPosition == 12 || @oldPosition - @newPosition == -12)
			@type = "capture"
		else
			puts("Not a move or capture!")
			return false
		end

		if @type == "capture"
			/if (@board[@oldPosition2 + 1] == nil || @board[@oldPosition - 1] == nil || @board[@oldPosition + 6] == nil || @board[@oldPosition - 6] == nil)
				print("bad capture 1")
				return false
			end
			currentlyPlayer = board[@oldPosition].getOwner()
			if (@board[@oldPosition + 1].getOwner == currentlyPlayer || @board[@oldPosition - 1].getOwner == currentlyPlayer || @board[@oldPosition + 6].getOwner == currentlyPlayer || @board[@oldPosition - 6].getOwner == currentlyPlayer)
				print("bad capture 2")
				return false
			end/
			if (@newPosition - @oldPosition == 2)
				if (@board.isEmpty?(@newPosition - 1) == true || @board.getOwnerAtPosition(@newPosition - 1) == @player.getPlayerID())
					puts "Cannot skip empty spot or capture own piece!"
					return false
				end
			elsif (@newPosition - @oldPosition == -2)
				if (@board.isEmpty?(@newPosition + 1) == true || @board.getOwnerAtPosition(@newPosition + 1) == @player.getPlayerID())
					puts "Cannot skip empty spot or capture own piece!"
					return false
				end
			elsif (@newPosition - @oldPosition == 12)
				if (@board.isEmpty?(@newPosition - 6) == true || @board.getOwnerAtPosition(@newPosition - 6) == @player.getPlayerID())
					puts "Cannot skip empty spot or capture own piece!"
					return false
				end
			elsif (@newPosition - @oldPosition == -12)
				if (@board.isEmpty?(@newPosition + 6) == true || @board.getOwnerAtPosition(@newPosition + 6) == @player.getPlayerID())
					puts "Cannot skip empty spot or capture own piece!"
					return false
				end
			end
		end

		if (@board.isEmpty?(@newPosition) == true)
			return true
		else 
			puts("That move is invalid!")
			return false
		end
	end

	def makeMove()
		if @type == "move"
			piece = Piece.new
			piece.Piece(@player.getPlayerID())
			@board.addPiece(piece, @newPosition)
			@board.removePiece(@oldPosition)
		elsif @type == "capture"
			piece = Piece.new
			piece.Piece(@player.getPlayerID())
			@board.addPiece(piece, @newPosition)
			@board.removePiece(@oldPosition)
			piecesToCapture()
			getExtraPiecesToRemove()
		end
	end	

	def piecesToCapture()
		if (@newPosition - @oldPosition == 2)
			@board.removePiece(@newPosition - 1)
		elsif (@newPosition - @oldPosition == -2)
			@board.removePiece(@newPosition + 1)
		elsif (@newPosition - @oldPosition == 12)
			@board.removePiece(@newPosition - 6)
		elsif (@newPosition - @oldPosition == -12)
			@board.removePiece(@newPosition + 6)
		end
	end

	def getExtraPiecesToRemove()
		puts "Select another opponent piece to remove"
		print "> "
		input = gets 
		@board.removePiece(input.to_i)
	end
end