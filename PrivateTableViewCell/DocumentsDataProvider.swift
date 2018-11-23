//
//  DocumentsDataProvider.swift
//  PrivateTableViewCell
//
//  Created by Alex Shirokov on 19.11.2018.
//  Copyright © 2018 Alex Shirokov. All rights reserved.
//

import Foundation

public struct Document {
	var title: String?
	var number: String?
	var priority: Int
	var date: Date?
	var content: String?
	var author: String?
}


public class DocumentsDataProvider {

	public lazy var documents: [Document] = {
		return [
			Document(title: "What's New in Swift", number: "123", priority: 0, date: dateFormatter.date(from: "2018-06-05T16:00:00.000Z"), content:"Hear about the latest advancements in Swift, the safe, fast, and expressive language. Find out about improvements to build times, code size, and runtime performance. Learn how to take advantage of new features in your code that eliminate boilerplate, increase safety and security, and improve your overall development productivity.", author: "Apple"),
			Document(title: "What's New in Cocoa Touch", number: "542", priority: 2, date: dateFormatter.date(from: "2018-06-06T17:00:00.000Z"), content:"iOS 12 enhances the Cocoa Touch frameworks to improve app performance and deliver exciting new features. Learn about performance best practices, security improvements, tools for supporting multiple screen sizes and shapes, new APIs for iMessage apps, Siri Shortcuts, and Swift refinements. Find out which sessions you won't want to miss throughout the week.", author: "Apple"),
			Document(title: "Document 3", number: "334", priority: 1, date: nil, content:nil, author: nil),
			Document(title: "Document 4", number: nil, priority: 1, date: nil, content:nil, author: nil),
			Document(title: "Document 5", number: "742", priority: 1, date: nil, content:nil, author: nil),
			Document(title: "Document 6", number: nil, priority: 2, date: nil, content:nil, author: nil),
			Document(title: "Document 7", number: "243", priority: 0, date: nil, content:nil, author: nil),
			Document(title: "Document 8", number: "726", priority: 0, date: nil, content:nil, author: nil)
		]
	}()

	// JSON often uses date string produced by JavaScript method Date.toJSON()
	// It conforms to ISO 8601
	// Date string with Z (UTC+0) timezone.
	private lazy var dateFormatter: DateFormatter = {
		let r = DateFormatter()
		r.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
		r.locale = Locale(identifier: "en_US_POSIX")
		r.timeZone = TimeZone.init(secondsFromGMT: 0)
		return r
	}()
}
