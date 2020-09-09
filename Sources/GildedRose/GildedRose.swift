public class GildedRose {
    var items:[Item]
    
    public init(items:[Item]) {
        self.items = items
    }
    
    
    private func updateItemQuality(item: Item) {
        if (ItemType.isSulfuras(item: item)) {
            // quality of sulfuras doesn't change
            return;
        } else if (ItemType.isAgedBrie(item: item)) {
            item.quality += 1;
        } else if (ItemType.isBackstagePass(item: item)) {
            if (item.sellIn > 10) {
                item.quality += 1;
            } else if (item.sellIn > 5) {
                item.quality += 2;
            } else if (item.sellIn > 0) {
                item.quality += 3;
            } else {
                item.quality = 0;
            }
        } else {
            var delta = -1;
            if (item.sellIn <= 0) {
                delta = -2;
            }
            
            if (ItemType.isConjured(item: item)) {
                delta *= 2;
            }
            
            item.quality += delta;
        }
        
        // bound the item quality in the interval 0~50 inclusive
        item.quality = min(max(item.quality, 0), 50);
    }
    
    private func updateItemSellIn(item: Item) {
        if (!ItemType.isSulfuras(item: item)) {
            item.sellIn -= 1;
        }
    }
    
    public func updateQuality() {
        items.forEach { item in
            updateItemQuality(item: item);
            updateItemSellIn(item: item);
        }
    }
    
    public func updateQualityOld() {
        for i in 0..<items.count {
            if (items[i].name != "Aged Brie" && items[i].name != "Backstage passes to a TAFKAL80ETC concert") {
                if (items[i].quality > 0) {
                    if (items[i].name != "Sulfuras, Hand of Ragnaros") {
                        items[i].quality = items[i].quality - 1
                    }
                }
            } else {
                if (items[i].quality < 50) {
                    items[i].quality = items[i].quality + 1
                    
                    if (items[i].name == "Backstage passes to a TAFKAL80ETC concert") {
                        if (items[i].sellIn < 11) {
                            if (items[i].quality < 50) {
                                items[i].quality = items[i].quality + 1
                            }
                        }
                        
                        if (items[i].sellIn < 6) {
                            if (items[i].quality < 50) {
                                items[i].quality = items[i].quality + 1
                            }
                        }
                    }
                }
            }
            
            if (items[i].name != "Sulfuras, Hand of Ragnaros") {
                items[i].sellIn = items[i].sellIn - 1
            }
            
            if (items[i].sellIn < 0) {
                if (items[i].name != "Aged Brie") {
                    if (items[i].name != "Backstage passes to a TAFKAL80ETC concert") {
                        if (items[i].quality > 0) {
                            if (items[i].name != "Sulfuras, Hand of Ragnaros") {
                                items[i].quality = items[i].quality - 1
                            }
                        }
                    } else {
                        items[i].quality = items[i].quality - items[i].quality
                    }
                } else {
                    if (items[i].quality < 50) {
                        items[i].quality = items[i].quality + 1
                    }
                }
            }
        }
    }
}
