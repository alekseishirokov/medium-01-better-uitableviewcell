//
//  DocumentTableViewCell.swift
//  PrivateTableViewCell
//
//  Created by Alex Shirokov on 19.11.2018.
//  Copyright © 2018 Alex Shirokov. All rights reserved.
//

import UIKit

final class DocumentTableViewCell: UITableViewCell {

	@IBOutlet weak private var titleLabel: UILabel!
	@IBOutlet weak private var priorityLabel: UILabel!
	@IBOutlet weak private var numberLabel: UILabel!
	@IBOutlet weak private var dateLabel: UILabel!
	@IBOutlet weak private var contentLabel: UILabel!
	@IBOutlet weak private var authorLabel: UILabel!
	@IBOutlet weak private var featureImage: UIImageView!

	public func configure(
		title: String,
		priority: Priority,
		number: String? = nil,
		date: Date? = nil,
		content: String? = nil,
		author: String? = nil
	){
		titleLabel.text = title
		numberLabel.text = number
		priorityLabel.text = priority.description()
		priorityLabel.textColor = (priority == .hight) ? UIColor.init(named: "documentPriorityHightColor") : UIColor.init(named: "documentPriorityDefaultColor")
		featureImage.isHidden = !(priority == .hight)
		dateLabel.text = (date != nil) ? dateFormatter.string(from: date!) : ""
		contentLabel.text = content
		authorLabel.text = author
	}

	public func reset(){
		titleLabel.text = ""
		numberLabel.text = ""
		priorityLabel.text = Priority.regular.description()
		priorityLabel.textColor =  UIColor.init(named: "documentPriorityDefaultColor")
		dateLabel.text = ""
		contentLabel.text = ""
		authorLabel.text = ""
		featureImage.isHidden = true
	}

//	override func awakeFromNib() {
//		super.awakeFromNib()
//		// Initialization code
//	}
//
//	override func setSelected(_ selected: Bool, animated: Bool) {
//		super.setSelected(selected, animated: animated)
//		// Configure the view for the selected state
//	}

	private lazy var dateFormatter: DateFormatter = {
		let r = DateFormatter()
		r.dateStyle = .short
		return r
	}()


	public enum Priority {
		case low
		case regular
		case hight

		public func description() -> String {
			switch self {
				case .low: return "low"
				case .regular: return "regular"
				case .hight: return "hight"
			}
		}
	}
}
