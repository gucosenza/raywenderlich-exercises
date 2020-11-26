//import XCTest
//
//class BullsEyeUITests: XCTestCase {
//  var app: XCUIApplication!
//  
//  override func setUp() {
//     continueAfterFailure = false
//
//    app = XCUIApplication()
//    app.launch()
//  }
//
//  func testGameStyleSwitch() {
//    // given
//    let slideButton = app.segmentedControls.buttons["Slide"]
//    let typeButton = app.segmentedControls.buttons["Type"]
//    let slideLabel = app.staticTexts["Get as close as you can to: "]
//    let typeLabel = app.staticTexts["Guess where the slider is: "]
//    
//    // then
//    if slideButton.isSelected {
//      XCTAssertTrue(slideLabel.exists)
//      XCTAssertFalse(typeLabel.exists)
//      
//      typeButton.tap()
//      XCTAssertTrue(typeLabel.exists)
//      XCTAssertFalse(slideLabel.exists)
//    } else if typeButton.isSelected {
//      XCTAssertTrue(typeLabel.exists)
//      XCTAssertFalse(slideLabel.exists)
//      
//      slideButton.tap()
//      XCTAssertTrue(slideLabel.exists)
//      XCTAssertFalse(typeLabel.exists)
//    }
//  }
//}
