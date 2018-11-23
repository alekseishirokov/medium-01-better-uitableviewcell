//
//  TableViewController.swift
//  PrivateTableViewCell
//
//  Created by Alex Shirokov on 19.11.2018.
//  Copyright © 2018 Alex Shirokov. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

	override func viewDidLoad() {
		super.viewDidLoad()

		tableView.register(
			UINib(nibName: "DocumentTableViewCell", bundle: nil),
			forCellReuseIdentifier: "idDocumentTableViewCell"
		)
	}

	let documents = DocumentsDataProvider().documents

	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

		let cell = tableView.dequeueReusableCell(withIdentifier: "idDocumentTableViewCell", for: indexPath) as! DocumentTableViewCell

		let document = documents[indexPath.row]

		// There is no need to call 'reset', if you write 'configure' method so, that it initializes all UI elements.
		// Otherwise, it is a good idea to call 'reset' here.
		//
		// cell.reset()

		cell.configure(
			title: document.title ?? "No Title",
			priority: priority(from: document.priority) ?? .regular,
			number: document.number,
			date: document.date,
			content: document.content,
			author: document.author
		)

		cell.setNeedsUpdateConstraints()

		return cell
	}

	override func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}

	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return documents.count
	}

	private func priority(from documentPriority:Int) -> DocumentTableViewCell.Priority? {
		switch documentPriority {
			case 0: return .low
			case 1: return .regular
			case 2: return .hight
			default: return nil
		}
	}

}
