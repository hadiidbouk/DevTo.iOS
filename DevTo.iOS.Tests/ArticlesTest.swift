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

    func testArticlesJsonDecoding() {
        
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
    
    func testArticleDetailsJsonDecoding() {
        do {
            if let path = Bundle(for: type(of: self)).path(forResource: "articleDetails", ofType: "json") {
                let fileUrl = URL(fileURLWithPath: path)
                let data = try Data(contentsOf: fileUrl, options: .mappedIfSafe)
                let jsonDecoder = JSONDecoder()
                jsonDecoder.dateDecodingStrategy = .iso8601
                let articleDetails = try jsonDecoder.decode(ArticleDetails.self, from: data)
                print(articleDetails)
            } else {
                fatalError("No file found!")
            }
        } catch {
            XCTFail()
        }
    }
}
