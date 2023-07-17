//
//  EditViewController.swift
//  pip_swift
//
//  Created by 老沙 on 2023/7/4.
//

import Foundation
import UIKit

class EditViewController: UIViewController, UITextViewDelegate {
    
    @IBOutlet weak var rightBar: UIBarButtonItem!
    
    @IBOutlet weak var playButton: UIButton!
    
    @IBOutlet weak var textView: UITextView!
    
    
    enum Status {
        case review, edit
    }
    
    private var status: Status = .review {
        willSet {
            switch newValue {
            case .review:
                rightBar.title = "编辑"
                playButton.isHidden = false
                title = "预览"
                textView.resignFirstResponder()
            case .edit:
                rightBar.title = "保存"
                playButton.isHidden = true
                title = "编辑中……"
                textView.becomeFirstResponder()
            }
        }
    }
    
    
    var editBlock: ((String)->Void)?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initUI()
        self.initData()
    }
    
    // MARK: ==== init ====
    private func initUI() {
        playButton.layer.cornerRadius = playButton.frame.height/2
        textView.textContainerInset = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
    }
    
    private func initData() {
        self.status = .review
    }
    
    // MARK: ==== Event ====
    
    @IBAction func clickRight(_ sender: UIBarButtonItem) {
        switch status {
        case .edit:
            status = .review
        case .review:
            status = .edit
        }
    }
    
    @IBAction func play(_ sender: UIButton) {
        
    }
    
    // MARK: ==== UITextViewDelegate ====
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = UIColor.black
        }
        self.status = .edit
    }

    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "请输入提示词"
            textView.textColor = UIColor.lightGray
        }
    }
}
