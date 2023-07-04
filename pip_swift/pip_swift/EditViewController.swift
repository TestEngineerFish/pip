//
//  EditViewController.swift
//  pip_swift
//
//  Created by 老沙 on 2023/7/4.
//

import Foundation
import UIKit

class EditViewController: UIViewController, UITextViewDelegate {
    
    private lazy var leftBar: UIBarButtonItem = {
        let item = UIBarButtonItem(title: "取消", style: .done, target: self, action: #selector(clickLeftBarAction))
        return item
    }()
    
    private lazy var rightBar: UIBarButtonItem = {
        let item = UIBarButtonItem(title: "取消", style: .done, target: self, action: #selector(clickRightBarAction))
        return item
    }()
    
    private var editView: UITextView = {
        let textView = UITextView()
        textView.layer.cornerRadius = 15
        textView.textContainerInset = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
        textView.text = "请输入提示词"
        textView.textColor = UIColor.lightGray
        return textView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initUI()
        self.initData()
        self.view.backgroundColor = .orange
    }
    
    // MARK: ==== init ====
    private func initUI() {
        self.title = "添加台词"
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "取消", style: .done, target: self, action: #selector(clickLeftBarAction))
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "取消", style: .done, target: self, action: #selector(clickRightBarAction))
        self.view.addSubview(editView)
        editView.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(15)
            make.right.equalToSuperview().offset(-15)
            make.top.equalToSuperview().offset(65)
            make.bottom.equalToSuperview().offset(-55)
        }
    }
    
    private func initData() {
        self.editView.delegate = self
    }
    
    // MARK: ==== Event ====
    @objc
    private func clickLeftBarAction() {
        self.navigationController?.dismiss(animated: true)
    }
    
    @objc
    private func clickRightBarAction() {
        
    }
    
    // MARK: ==== UITextViewDelegate ====
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }

    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "请输入提示词"
            textView.textColor = UIColor.lightGray
        }
    }
}
