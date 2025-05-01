import Foundation


@Observable
class Alphabetizer {
    private let tileCount = 3
    private var vocab: Vocabulary


    var tiles = [Tile]()
    var score = 0
    var message: Message = .instructions
    
    // True and false
    private var isAlphabetized = false

    init(vocab: Vocabulary = .oceanAnimals) {
        self.vocab = vocab
        startNewGame()
    }


    /// Checks if tiles are in alphabetical order
    func submit() {
        // Check if tiles are alphabetized
        let userSortedTiles = tiles.sorted {
            $0.position.x < $1.position.x
        }
        
        let alphabeticallySortedTiles = tiles.sorted {
            $0.word.lexicographicallyPrecedes($1.word)
        }
        
        let isAlphabetized = userSortedTiles == alphabeticallySortedTiles
        
        // If is alphabetized, increment the score
        if isAlphabetized {
            score += 1
        }
        
        // Message to win or lose
        message = isAlphabetized ? .youWin : .tryAgain
        
        
        // If correct, flip the tiles
        for (tile, correctTile) in zip(userSortedTiles, alphabeticallySortedTiles) {
            // Operate on specific tile
            let tileIsAlphabetized = tile == correctTile
            tile.flipped = tileIsAlphabetized
        }
        
        // Delay for 2 secs
        Task { @MainActor in
            try await Task.sleep(for: .seconds(2))
        }
        
        // Start a new game (if alphabetized)
        if isAlphabetized {
            startNewGame()
        }
        
        // Flip tiles back to words
        for tile in tiles {
            tile.flipped = false
        }
        
        // Display instructions
        message = .instructions
    }


    // MARK: private implementation

    /// Updates `tiles` with a new set of unalphabetized words
    private func startNewGame() {
        let newWords = vocab.selectRandomWords(count: tileCount)
        for word in newWords {
            if tiles.isEmpty {
                tiles.append(Tile(word: word))
            } else {
                for (tile, word) in zip(tiles, newWords) {
                    tile.word = word
                }
            }
        }
    }
}
