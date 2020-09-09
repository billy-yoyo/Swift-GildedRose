//
//  File.swift
//  
//
//  Created by Will Page on 09/09/2020.
//

import Foundation

public class ItemType {
    public static func isAgedBrie(item: Item) -> Bool {
        return item.name == "Aged Brie";
    }
    
    public static func isSulfuras(item: Item) -> Bool {
        return item.name.starts(with: "Sulfuras");
    }
    
    public static func isBackstagePass(item: Item) -> Bool {
        return item.name.starts(with: "Backstage pass");
    }
    
    public static func isConjured(item: Item) -> Bool {
        return item.name.starts(with: "Conjured");
    }
}

