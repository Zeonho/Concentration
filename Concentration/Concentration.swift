//
//  Concentration.swift
//  Concentration
//
//  Created by Jinhao Chen on 6/5/18.
//  Copyright © 2018 Jinhao Chen. All rights reserved.
//

import Foundation

class Concentration
{
    private(set) var cards = [Card]()
	
    private var indexOfOneAndOnlyFaceUpCard: Int? {
        get {
            return cards.indices.filter { cards[$0].isFaceUp }.oneAndOnly
        }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
        }
        
        
    }
	
	func chooseCard(at index: Int) {
        assert(cards.indices.contains(index), "Concentration.chooseCard(at: \(index)) : Choosen index out of range")
		if !cards[index].isMatched {
			if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
				// check if cards match
				if cards[matchIndex] == cards[index] {
					cards[matchIndex].isMatched = true
					cards[index].isMatched = true
                    
                    cards[index].isFaceUp = false
                    cards[matchIndex].isFaceUp = false
                } else {
                    cards[index].isFaceUp = true
                }
			} else {
                indexOfOneAndOnlyFaceUpCard = index
			}
        } else {
            print("cards[\(index)].isMatched")
        }
        
	}
    //        if cards[index].isFaceUp {
    //            cards[index].isFaceUp = false
    //        } else {
    //            cards[index].isFaceUp = true
    //        }
	
	init(numberOfPairsOfCards: Int) {
        assert(numberOfPairsOfCards > 0, "Concentration.init(\(numberOfPairsOfCards)) : You must have at least one pair of cards")
		for _ in 0..<numberOfPairsOfCards {
			// 0... means 0 to numberOfPairsOfCards including numberOfPairsOfCards
			let card = Card()
			cards += [card, card]
		}
		// TODO: Shuffle the cards
        cards.shuffle()
	}
}

extension Collection {
    var oneAndOnly: Element? {
        return count == 1 ? first : nil
    }
}

extension MutableCollection {
    /// Shuffles the contents of this collection.
    mutating func shuffle() {
        let c = count
        guard c > 1 else { return }
        
        for (firstUnshuffled, unshuffledCount) in zip(indices, stride(from: c, to: 1, by: -1)) {
            // Change `Int` in the next line to `IndexDistance` in < Swift 4.1
            let d: Int = numericCast(arc4random_uniform(numericCast(unshuffledCount)))
            let i = index(firstUnshuffled, offsetBy: d)
            swapAt(firstUnshuffled, i)
        }
    }
}

extension Sequence {
    /// Returns an array with the contents of this sequence, shuffled.
    func shuffled() -> [Element] {
        var result = Array(self)
        result.shuffle()
        return result
    }
}
