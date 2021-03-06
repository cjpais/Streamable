import XCTest
@testable import Streamable

@available(iOS 10.0, *)
@available(OSX 10.12, *)
class StreamableTests: XCTestCase {
    
    func testStreamConfigInit() {
        let config = StreamConfig(namespace: "test", name: "test", version: "0.0.1", uuid: UUID(), b64auth: "Y2o6dGVzdHBhc3M=")
        XCTAssertEqual(config.namespace, "test")
        XCTAssertEqual(config.name, "test")
        XCTAssertEqual(config.version, "0.0.1")
    }
    
    func testStreamableDataInit() {
        let config = StreamConfig(namespace: "test", name: "test", version: "0.0.1", uuid: UUID(), b64auth: "Y2o6dGVzdHBhc3M=")
        let streamable = StreamableData<String>(config: config, data: "test data")
        XCTAssertEqual(streamable.config.namespace, config.namespace)
        XCTAssertEqual(streamable.data, "test data")
    }
    
    func checkError(error: Error?) {
        XCTAssert(error == nil)
    }
    
    func testStreamableDataSendTest() {
        let config = StreamConfig(namespace: "cj/test", name: "streamableLibrary", version: "0.0.1", uuid: UUID(), location: Point(lat: 23.1231, long: -34.123), b64auth: "Y2o6dGVzdHBhc3M=")
        let streamable = StreamableData<String>(config: config, data: "test data")
        streamable.sendStream(to: "http://localhost:10000/dev", completionHandler: checkError)
        sleep(1)
    }
    
    func testExistingUUID() {
        let config = StreamConfig(namespace: "cj/test", name: "streamableLibrary", version: "0.0.1", uuid: UUID(uuidString: "e6a20b77-b4ec-4f79-b211-e93209714264")!, location: Point(lat: 23.1231, long: -34.123), b64auth: "Y2o6dGVzdHBhc3M=")
        let streamable = StreamableData<String>(config: config, data: "test data")
        streamable.sendStream(to: "http://localhost:10000/dev", completionHandler: checkError)
        sleep(1)
    }
}
