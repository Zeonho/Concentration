//
//  Card.swift
//  Concentration
//
//  Created by Jinhao Chen on 6/5/18.
//  Copyright © 2018 Jinhao Chen. All rights reserved.
//

import Foundation

struct Card: Hashable {
    
    var hashValue: Int {
        return identifier
    }
    
    static func == (lhs: Card, rhs: Card) -> Bool {
        return lhs.identifier == rhs.identifier
    }
    
	var isFaceUp = false
	var isMatched = false
	private var identifier: Int
	
	private static var identifierFactory = 0
    
	static func getUniqueIdentifier() -> Int {
		identifierFactory += 1
		return Card.identifierFactory
	}
	
	init() {
		self.identifier = Card.getUniqueIdentifier()
	}
}
