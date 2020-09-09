@testable import GildedRose
import XCTest

class GildedRoseTests: XCTestCase {

    func testNormalItemDegradesInQuality() {
        let quality = 10;
        let items = [Item(name: "item", sellIn: 5, quality: quality)]
        let app = GildedRose(items: items);
        app.updateQuality();
        XCTAssertEqual(app.items[0].quality, quality - 1);
    }
    
    func testNormalItemQualityDegradesFasterAfterSellIn() {
        let quality = 10;
        let items = [Item(name: "item", sellIn: 0, quality: quality)]
        let app = GildedRose(items: items);
        app.updateQuality();
        XCTAssertEqual(app.items[0].quality, quality - 2);
    }
    
    func testNormalItemSellInReduces() {
        let sellIn = 5;
        let items = [Item(name: "item", sellIn: sellIn, quality: 10)]
        let app = GildedRose(items: items);
        app.updateQuality();
        XCTAssertEqual(app.items[0].sellIn, sellIn - 1);
    }
    
    func testQualityIsNeverNegative() {
        let items = [Item(name: "item", sellIn: 10, quality: 0)]
        let app = GildedRose(items: items);
        app.updateQuality();
        XCTAssertEqual(app.items[0].quality, 0);
    }
    
    func testAgedBrieIncreasesInQuality() {
        let quality = 5;
        let items = [Item(name: "Aged Brie", sellIn: 10, quality: quality)];
        let app = GildedRose(items: items);
        app.updateQuality();
        XCTAssertEqual(app.items[0].quality, quality + 1);
    }
    
    func testQualityNeverIncreasesAbove50() {
        let items = [Item(name: "Aged Brie", sellIn: 10, quality: 50)];
        let app = GildedRose(items: items);
        app.updateQuality();
        XCTAssertEqual(app.items[0].quality, 50);
    }
    
    func testSulfurasSellInDoesNotReduce() {
        let sellIn = 10;
        let items = [Item(name: "Sulfuras", sellIn: sellIn, quality: 40)];
        let app = GildedRose(items: items);
        app.updateQuality();
        XCTAssertEqual(app.items[0].sellIn, sellIn);
    }
    
    func testSulfurasQualityDoesNotChange() {
        let quality = 40;
        let items = [Item(name: "Sulfuras", sellIn: 10, quality: quality)];
        let app = GildedRose(items: items);
        app.updateQuality();
        XCTAssertEqual(app.items[0].quality, quality);
    }
    
    func testSulfurasQualityCanExceed50() {
        let quality = 70;
        let items = [Item(name: "Sulfuras", sellIn: 10, quality: quality)];
        let app = GildedRose(items: items);
        app.updateQuality();
        XCTAssertEqual(app.items[0].quality, quality);
    }
    
    func testConjuredWaterReducesInQualityFaster() {
        let quality = 10;
        let items = [Item(name: "Conjured Water", sellIn: 10, quality: quality)];
        let app = GildedRose(items: items);
        app.updateQuality();
        XCTAssertEqual(app.items[0].quality, quality - 2);
    }
    
    func testConjuredWaterReducesInQualityFasterAfterSellIn() {
        let quality = 10;
        let items = [Item(name: "Conjured Water", sellIn: 0, quality: quality)];
        let app = GildedRose(items: items);
        app.updateQuality();
        XCTAssertEqual(app.items[0].quality, quality - 4);
    }
    
    func testConjuredBreadReducesInQualityFaster() {
        let quality = 10;
        let items = [Item(name: "Conjured Bread", sellIn: 10, quality: quality)];
        let app = GildedRose(items: items);
        app.updateQuality();
        XCTAssertEqual(app.items[0].quality, quality - 2);
    }
    
    func testConjuredBreadReducesInQualityFasterAfterSellIn() {
        let quality = 10;
        let items = [Item(name: "Conjured Bread", sellIn: 0, quality: quality)];
        let app = GildedRose(items: items);
        app.updateQuality();
        XCTAssertEqual(app.items[0].quality, quality - 4);
    }
    
    func testBackstagePassIncreasesInQuality() {
        let quality = 10;
        let items = [Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 20, quality: quality)];
        let app = GildedRose(items: items);
        app.updateQuality();
        XCTAssertEqual(app.items[0].quality, quality + 1);
    }
    
    func testBackstagePassIncreasesInQualityBy2whenSellInIs10() {
        let quality = 10;
        let items = [Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 10, quality: quality)];
        let app = GildedRose(items: items);
        app.updateQuality();
        XCTAssertEqual(app.items[0].quality, quality + 2);
    }
    
    func testBackstagePassIncreasesInQualityBy2whenSellInIs6() {
        let quality = 10;
        let items = [Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 6, quality: quality)];
        let app = GildedRose(items: items);
        app.updateQuality();
        XCTAssertEqual(app.items[0].quality, quality + 2);
    }
    
    func testBackstagePassIncreasesInQualityBy3whenSellInIs5() {
        let quality = 10;
        let items = [Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 5, quality: quality)];
        let app = GildedRose(items: items);
        app.updateQuality();
        XCTAssertEqual(app.items[0].quality, quality + 3);
    }
    
    func testBackstagePassQualityReducesToZeroAfterConcert() {
        let quality = 10;
        let items = [Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 0, quality: quality)];
        let app = GildedRose(items: items);
        app.updateQuality();
        XCTAssertEqual(app.items[0].quality, 0);
    }

    static var allTests : [(String, (GildedRoseTests) -> () throws -> Void)] {
        return [
            ("testNormalItemDegradesInQuality", testNormalItemDegradesInQuality),
            ("testNormalItemQualityDegradesFasterAfterSellIn", testNormalItemQualityDegradesFasterAfterSellIn),
            ("testNormalItemSellInReduces", testNormalItemSellInReduces),
            ("testQualityIsNeverNegative", testQualityIsNeverNegative),
            ("testAgedBrieIncreasesInQuality", testAgedBrieIncreasesInQuality),
            ("testQualityNeverIncreasesAbove50", testQualityNeverIncreasesAbove50),
            ("testSulfurasSellInDoesNotReduce", testSulfurasSellInDoesNotReduce),
            ("testSulfurasQualityDoesNotChange", testSulfurasQualityDoesNotChange),
            ("testSulfurasQualityCanExceed50", testSulfurasQualityCanExceed50),
            ("testConjuredWaterReducesInQualityFaster", testConjuredWaterReducesInQualityFaster),
            ("testConjuredWaterReducesInQualityFasterAfterSellIn", testConjuredWaterReducesInQualityFasterAfterSellIn),
            ("testConjuredBreadReducesInQualityFaster", testConjuredBreadReducesInQualityFaster),
            ("testConjuredBreadReducesInQualityFasterAfterSellIn", testConjuredBreadReducesInQualityFasterAfterSellIn),
            ("testBackstagePassIncreasesInQuality", testBackstagePassIncreasesInQuality),
            ("testBackstagePassIncreasesInQualityBy2whenSellInIs10", testBackstagePassIncreasesInQualityBy2whenSellInIs10),
            ("testBackstagePassIncreasesInQualityBy2whenSellInIs6", testBackstagePassIncreasesInQualityBy2whenSellInIs6),
            ("testBackstagePassIncreasesInQualityBy3whenSellInIs5", testBackstagePassIncreasesInQualityBy3whenSellInIs5),
            ("testBackstagePassQualityReducesToZeroAfterConcert", testBackstagePassQualityReducesToZeroAfterConcert),
        ]
    }
}
