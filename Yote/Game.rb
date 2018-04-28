load 'Board.rb'
load 'Player.rb'
load 'Move.rb'

class Game
	def Game()
		@board = Board.new
		@player1 = Player.new
		@player2 = Player.new
		
		@board.Board()
		@player1.Player(1)
		@player2.Player(2)
	end

	def startGame()
		Game()
		turn = 1
		
		while (@player1.hasPieces() && @player2.hasPieces())
			for i in 1..30
				if (@board.isEmpty?(i) == true)
					print "- "
				elsif (@board.isEmpty?(i) == false)
					if (@board.getOwnerAtPosition(i) == 1)
						print "o "
					else
						print "x "
					end
				end

				if (i%6 == 0)
					print "\n"
				end
			end

			puts ("\nPlayer #{turn} what would you like to do?")
			puts ("1 - Move Piece")
			puts ("2 - Place Piece")
			print ("> ")
			inp = gets

			if (inp == "1\n")
				if (@board.pieceOnBoard?(turn) == true)
					puts ("\nWhat piece would you like to move?")
					print ("> ")
					pieceToMove = gets;

					if (@board.isEmpty?(pieceToMove.to_i) == false && @board.getOwnerAtPosition(pieceToMove.to_i) == turn)
						puts ("Where would you like to move piece #{pieceToMove}")
						print ("> ")
						newPieceLocation = gets;
						@move = Move.new

						if (turn == 1)
							@move.Move(pieceToMove.to_i, newPieceLocation.to_i, @player1, @board)
						else
							@move.Move(pieceToMove.to_i, newPieceLocation.to_i, @player2, @board)
						end

						if (@move.isMoveValid() == true)
							@move.makeMove()
							if (turn == 1)
								turn = 2
							else
								turn = 1
							end
						end
					else
						puts ("\nThat is not Player #{turn}'s piece!")
					end
				else
					puts ("Player #{turn} has no pieces on board!")
				end
			elsif (inp == "2\n")
				print ("\nPlayer #{turn} place a piece (1-30): ")
				location = gets
				@piece = Piece.new
				@piece.Piece(turn)
				if (@board.isEmpty?(location.to_i) == true && location.to_i != 0)
					@board.addPiece(@piece, location.to_i)
					if (turn == 1)
						turn = 2
					else
						turn = 1
					end
				else
					if (location.to_i < 1 || location.to_i > 30)
						puts ("\nEnter a number between 1-30!")
					else
						puts ("\nThat spot is taken!")
					end
				end
			end
		end

		return @playerID
	end

	def waitForMove(currentPlayer)

	end

end

game = Game.new
game.startGame()