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
	var cards = Array<Card>()
	
	var indexOfOneAndOnlyFaceUpCard: Int?
	
	func chooseCard(at index: Int) {
		if !cards[index].isMatched {
			if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
				// check if cards match
				if cards[matchIndex].identifier == cards[index].identifier {
					cards[matchIndex].isMatched = true
					cards[index].isMatched = true
				}
				cards[index].isFaceUp = true
				indexOfOneAndOnlyFaceUpCard = nil
			} else {
				// either no cards or 2 cards afe face up
				for flipDownIndex in cards.indices {
					cards[flipDownIndex].isFaceUp = false
				}
				cards[index].isFaceUp = true
				indexOfOneAndOnlyFaceUpCard = index
			}
		}
//		if cards[index].isFaceUp {
//			cards[index].isFaceUp = false
//		} else {
//			cards[index].isFaceUp = true
//		}
	}
	
	init(numberOfPairsOfCards: Int) {
		for _ in 0..<numberOfPairsOfCards {
			// 0... means 0 to numberOfPairsOfCards including numberOfPairsOfCards
			let card = Card()
			cards += [card, card]
		}
		// TODO: Shuffle the cards
	}
}
