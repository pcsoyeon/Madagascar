//
//  CustomActivity.swift
//  Session#Share
//
//  Created by soyeon on 2021/10/23.
//

import UIKit

protocol CustomActivityDelegate: NSObjectProtocol {
    func performActionCompletion(activity: CustomActivity)
}

class CustomActivity: UIActivity {
    weak var delegate: CustomActivityDelegate?
    
    override var activityType: UIActivity.ActivityType? { return .none }
    override class var activityCategory: UIActivity.Category { return .action }
    override var activityTitle: String? { return "Open in Safari" }
    override var activityImage: UIImage? { return UIImage(systemName: "heart.fill") }
    override func canPerform(withActivityItems activityItems: [Any]) -> Bool {
        return true
    }
    override func prepare(withActivityItems activityItems: [Any]) {
        
    }
    override func perform() {
        self.delegate?.performActionCompletion(activity: self)
        activityDidFinish(true)
    }
}

