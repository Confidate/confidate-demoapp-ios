import XCTest
@testable import Confidate // Import your app's module here

class IPFSTests: XCTestCase {

    func testUploadFileToIPFS() {
        let expectation = XCTestExpectation(description: "Upload file to IPFS and receive hash")

        // Setup your mock URLProtocol to intercept the network request and provide the expected response
        
        
        guard let fileURL = Bundle(for: type(of: self)).url(forResource: "test", withExtension: "png") else {
            XCTFail("Test file not found in bundle.")
            return
        }

        uploadFileToIPFS(fileURL: fileURL) { hash, error in
            XCTAssertNotNil(hash, "Hash should not be nil")
            XCTAssertNil(error, "Error should be nil")
            
            if let hash = hash {
                print("Pinned IPFS hash: \(hash)")
            }

            expectation.fulfill()
        }
        
        print("Waiting for completion")

        wait(for: [expectation], timeout: 15.0)
        
        // To access the image please head to `https://confidenti.infura-ipfs.io/ipfs/<IPFS HASH>`
    }


    // Additional setup for mocking URLProtocol would be needed here
}
