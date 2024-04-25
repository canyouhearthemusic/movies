//
//  Settings.swift
//  MoviesApp
//
//  Created by Alibek on 16.04.2024.
//

import UIKit
import SnapKit

final class SettingsViewController: UIViewController {
    
    let button: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(exit), for: .touchUpInside)
        button.setTitle("Exit", for: .normal)
        button.backgroundColor = .white
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
    }
    
    @objc
    func exit() {
        button.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.size.equalTo(65)
        }
    }
}
