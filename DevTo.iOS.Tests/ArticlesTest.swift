//
//  DevTo_iOS_Tests.swift
//  DevTo.iOS.Tests
//
//  Created by Hadi Dbouk on 5/17/19.
//  Copyright © 2019 hadiidbouk. All rights reserved.
//

import XCTest
@testable import DevTo_iOS

class ArticlesTest: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    func testJsonDecoding() {
        
        do {
            if let path = Bundle(for: type(of: self)).path(forResource: "articles", ofType: "json") {
                let fileUrl = URL(fileURLWithPath: path)
                let data = try Data(contentsOf: fileUrl, options: .mappedIfSafe)
                let jsonDecoder = JSONDecoder()
                jsonDecoder.dateDecodingStrategy = .iso8601
                let articles = try jsonDecoder.decode([Article].self, from: data)
                print(articles)
            } else {
                fatalError("No file found!")
            }
        } catch {
            XCTFail()
        }
    }
}
