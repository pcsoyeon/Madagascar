//
//  ViewController.swift
//  Session#Share
//
//  Created by soyeon on 2021/10/23.
//

import UIKit

class ViewController: UIViewController, CustomActivityDelegate, UITextFieldDelegate {

    @IBOutlet weak var dataTextField: UITextField!
    @IBOutlet weak var shareButton: UIButton!
    
    func performActionCompletion(activity: CustomActivity) {
        guard let url = URL(string: dataTextField.text!), UIApplication.shared.canOpenURL(url) else { return }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        shareButton.setTitle("share", for: .normal)
        dataTextField.delegate = self
    }

    @IBAction func touchUpShare(_ sender: Any) {
        let customActivity = CustomActivity()
        customActivity.delegate = self
        shareContents(shareObject: [dataTextField.text!], custom: [customActivity])
    }
    
    private func shareContents(shareObject: [Any], custom: [UIActivity]?) {
        let activityViewController = UIActivityViewController(activityItems: shareObject,
                                                              applicationActivities: custom)
        
        activityViewController.completionWithItemsHandler = { (activity, success, items, error) in
            if success {
                // 성공했을 때 작업
                print("공유 성공")
            }  else  {
                // 실패했을 때 작업
                print("공유 실패")
            }
        }
        self.present(activityViewController, animated: true, completion: nil)
    }
}

