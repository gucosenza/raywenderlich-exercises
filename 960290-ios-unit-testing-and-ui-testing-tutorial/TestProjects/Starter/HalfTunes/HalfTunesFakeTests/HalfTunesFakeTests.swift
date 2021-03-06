import XCTest
@testable  import HalfTunes

class HalfTunesFakeTests: XCTestCase {

  var sut: SearchViewController!

  override func setUp() {
    super.setUp()
    sut = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController() as? SearchViewController
    
    let testBundle = Bundle(for: type(of: self))
    let path = testBundle.path(forResource: "abbaData", ofType: "json")
    let data = try? Data(contentsOf: URL(fileURLWithPath: path!), options: .alwaysMapped)

    let url = URL(string: "https://itunes.apple.com/search?media=music&entity=song&term=abba")
    let urlResponse = HTTPURLResponse(
      url: url!,
      statusCode: 200,
      httpVersion: nil,
      headerFields: nil)

    let sessionMock = URLSessionMock(data: data, response: urlResponse, error: nil)
    sut.defaultSession = sessionMock
  }

  override func tearDown() {
    sut = nil
    super.tearDown()
  }
  
  func test_UpdateSearchResults_ParsesData() {
    // given
    let promise = expectation(description: "Status code: 200")

    // when
    XCTAssertEqual(sut.searchResults.count,0,"searchResults should be empty before the data task runs")
    let url = URL(string: "https://itunes.apple.com/search?media=music&entity=song&term=abba")
    let dataTask = sut.defaultSession.dataTask(with: url!) { data, response, error in
      // if HTTP request is successful, call updateSearchResults(_:)
      // which parses the response data into Tracks
      if let error = error {
        print(error.localizedDescription)
      } else if let httpResponse = response as? HTTPURLResponse,
        httpResponse.statusCode == 200 {
        self.sut.updateSearchResults(data)
      }
      promise.fulfill()
    }
    dataTask.resume()
    wait(for: [promise], timeout: 5)

    // then
    XCTAssertEqual(sut.searchResults.count, 3, "Didn't parse 3 items from fake response")
  }



}
