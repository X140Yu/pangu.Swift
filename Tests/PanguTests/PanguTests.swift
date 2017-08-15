import XCTest
@testable import Pangu

class panguTests: XCTestCase {

    func testSpacing() {
        XCTAssertEqual("新八的構造成分有95%是眼鏡、3%是水、2%是垃圾".spaced, "新八的構造成分有 95% 是眼鏡、3% 是水、2% 是垃圾")
        XCTAssertEqual("JUST WE就是JUST WE，既不偉大也不卑微！".spaced, "JUST WE 就是 JUST WE，既不偉大也不卑微！")
        XCTAssertEqual("Mr.龍島主道：「Let's Party!各位高明博雅君子！」".spaced, "Mr. 龍島主道：「Let's Party! 各位高明博雅君子！」")
        XCTAssertEqual("前面#銀河公車指南 #銀河大客車指南 後面".spaced, "前面 #銀河公車指南 #銀河大客車指南 後面")
        XCTAssertEqual("前面(中文123漢字) tail".spaced, "前面 (中文 123 漢字) tail")
        XCTAssertEqual("前面$100後面".spaced, "前面 $100 後面")
        XCTAssertEqual("前面100%後面".spaced, "前面 100% 後面")
        XCTAssertEqual("前面^後面".spaced, "前面 ^ 後面")
        XCTAssertEqual("前面[123漢字]後面".spaced, "前面 [123 漢字] 後面")
    }

    static var allTests = [
        ("testSpacing", testSpacing),
    ]
}
