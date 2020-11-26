
import XCTest
@testable import BullsEye

class MockUserDefaults: UserDefaults {
  var gameStyleChanged = 0
  override func set(_ value: Int, forKey defaultName: String) {
    if defaultName == "gameStyle" {
      gameStyleChanged += 1
    }
  }
}

class BullsEyeMockTests: XCTestCase {
  
  var sut: ViewController!
  var mockUserDefaults: MockUserDefaults!
  
  override func setUp() {
    super.setUp()

    sut = UIStoryboard(name: "Main", bundle: nil)
      .instantiateInitialViewController() as? ViewController
    mockUserDefaults = MockUserDefaults(suiteName: "testing")
    sut.defaults = mockUserDefaults
  }

  override func tearDown() {
    sut = nil
    mockUserDefaults = nil
    super.tearDown()
  }
  
  func testGameStyleCanBeChanged() {
    // given
    let segmentedControl = UISegmentedControl()

    // when
    XCTAssertEqual(mockUserDefaults.gameStyleChanged,0,"gameStyleChanged should be 0 before sendActions")
    segmentedControl.addTarget(sut,action: #selector(ViewController.chooseGameStyle(_:)), for: .valueChanged)
    segmentedControl.sendActions(for: .valueChanged)

    // then
    XCTAssertEqual(mockUserDefaults.gameStyleChanged,1,"gameStyle user default wasn't changed")
  }


}
