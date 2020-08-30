import XCTest
@testable import Streamable

class StreamableTests: XCTestCase {
    
    func testStreamConfigInit() {
        let config = StreamConfig(namespace: "test", name: "test", version: "0.0.1")
        XCTAssertEqual(config.namespace, "test")
        XCTAssertEqual(config.name, "test")
        XCTAssertEqual(config.version, "0.0.1")
    }
    
    func testStreamableDataInit() {
        let config = StreamConfig(namespace: "test", name: "test", version: "0.0.1")
        let streamable = StreamableData<String>(config: config, data: "test data")
        XCTAssertEqual(streamable.config.namespace, config.namespace)
        XCTAssertEqual(streamable.data, "test data")
    }
    
    func checkError(error: Error?) {
        XCTAssert(error == nil)
    }
    
    func testStreamableDataSendTest() {
        let config = StreamConfig(namespace: "cj/test", name: "streamableLibrary", version: "0.0.1")
        let streamable = StreamableData<String>(config: config, data: "test data")
        streamable.sendStream(to: "http://192.168.1.130:10000/dev", completionHandler: checkError)
        sleep(1)
    }
}
