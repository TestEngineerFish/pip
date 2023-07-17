//
//  HomeItem.swift
//  pip_swift
//
//  Created by 老沙 on 2023/7/17.
//

import Foundation
import UIKit

class HomeItem: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .orange
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
