import XCTest
@testable import Streamable

class StreamableTests: XCTestCase {
    
    func testStreamConfigInit() {
        let config = StreamConfig(namespace: "test", name: "test", version: "0.0.1", uuid: UUID())
        XCTAssertEqual(config.namespace, "test")
        XCTAssertEqual(config.name, "test")
        XCTAssertEqual(config.version, "0.0.1")
    }
    
    func testStreamableDataInit() {
        let config = StreamConfig(namespace: "test", name: "test", version: "0.0.1", uuid: UUID())
        let streamable = StreamableData<String>(config: config, data: "test data")
        XCTAssertEqual(streamable.config.namespace, config.namespace)
        XCTAssertEqual(streamable.data, "test data")
    }
    
    func checkError(error: Error?) {
        XCTAssert(error == nil)
    }
    
    func testStreamableDataSendTest() {
        let config = StreamConfig(namespace: "cj/test", name: "streamableLibrary", version: "0.0.1", uuid: UUID(), location: Point(lat: 23.1231, long: -34.123))
        let streamable = StreamableData<String>(config: config, data: "test data")
        streamable.sendStream(to: "http://192.168.1.130:10000/dev", completionHandler: checkError)
        sleep(1)
    }
    
    func testDate() {
        
    }
    
    func testExistingUUID() {
        let config = StreamConfig(namespace: "cj/test", name: "streamableLibrary", version: "0.0.1", uuid: UUID(uuidString: "e6a20b77-b4ec-4f79-b211-e93209714264")!, location: Point(lat: 23.1231, long: -34.123))
        let streamable = StreamableData<String>(config: config, data: "test data")
        streamable.sendStream(to: "http://192.168.1.130:10000/dev", completionHandler: checkError)
        sleep(1)
    }
}
