//
//  NetworkJSONDictionaryResourceTypeTests.swift
//  TABResourceLoader
//
//  Created by Luciano Marisi on 03/10/2016.
//  Copyright © 2016 Luciano Marisi. All rights reserved.
//

import XCTest
@testable import TABResourceLoader

struct MockNetworkJSONDictionaryResourceType: NetworkJSONDictionaryResourceType {
  typealias Model = String
  let url: URL
  
  func modelFrom(jsonDictionary: [String : Any]) -> String? {
    return ""
  }
  
}

class NetworkJSONDictionaryResourceTypeTests: XCTestCase {

  let url = URL(string: "www.test.com")!

  func test_correctDefaultValues() {
    let resource = MockNetworkJSONDictionaryResourceType(url: url)
    XCTAssertEqual(resource.httpRequestMethod, HTTPMethod.get)
    XCTAssertEqual(resource.HTTPHeaderFields!, ["Content-Type": "application/json"])
    XCTAssertNil(resource.JSONBody)
    XCTAssertNil(resource.queryItems)
  }
  
}
