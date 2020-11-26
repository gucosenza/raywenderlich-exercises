import XCTest
@testable import BullsEye

class BullsEyeTests: XCTestCase {
  
  var sut: BullsEyeGame!
  
  override func setUp() {
    super.setUp()
    sut = BullsEyeGame()
    sut.startNewGame()
  }
  
  override func tearDown() {
    sut = nil
    super.tearDown()
  }

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
  
  func testScoreIsComputed() {
    // 1. given
    let guess = sut.targetValue + 5

    // 2. when
    sut.check(guess: guess)

    // 3. then
    XCTAssertEqual(sut.scoreRound, 95, "Score computed from guess is wrong")
  }
  
  func testScoreIsComputedWhenGuessLTTarget() {
    // 1. given
    let guess = sut.targetValue - 5

    // 2. when
    sut.check(guess: guess)

    // 3. then
    XCTAssertEqual(sut.scoreRound, 95, "Score computed from guess is wrong")
  }



}
