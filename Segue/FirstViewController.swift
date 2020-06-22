//
//  FirstViewController.swift
//  Segue
//
//  Created by Павел on 22.06.2020.
//  Copyright © 2020 Pavel Laukhin. All rights reserved.
//

import UIKit

final class FirstViewController: UIViewController {
    
    let navBarTitle = "Simple app"
    let launchTimeTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Launch time:"
        label.font = UIFont.systemFont(ofSize: 17.0)
        label.textColor = .black
        return label
    }()
    let launchTimeLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = UIFont.systemFont(ofSize: 17.0)
        label.textColor = .black
        return label
    }()
    let appearanceTimeTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Appearance time:"
        label.font = UIFont.systemFont(ofSize: 17.0)
        label.textColor = .black
        return label
    }()
    let appearanceTimeLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = UIFont.systemFont(ofSize: 17.0)
        label.textColor = .black
        return label
    }()
    private lazy var pushButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Push", for: .normal)
        button.addTarget(self, action: #selector(pushButtonTapped), for: .touchUpInside)
        return button
    }()
    private lazy var updateButton: UIBarButtonItem = {
        let button = UIBarButtonItem() //barButtonSystemItem: .refresh, target: self, action: #selector(updateButtonTapped))
        button.target = self
        button.action = #selector(updateButtonTapped)
        button.title = "Update"
        return button
    }()
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        title = navBarTitle
        navigationItem.rightBarButtonItems = [updateButton]
        addSubwiews()
        showLaunchTime()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        setFrames()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        showAppearanceTime()
    }
    
    private func addSubwiews() {
        view.addSubview(launchTimeTitleLabel)
        view.addSubview(launchTimeLabel)
        view.addSubview(appearanceTimeTitleLabel)
        view.addSubview(appearanceTimeLabel)
        view.addSubview(pushButton)
    }
    
    private func setFrames() {
        launchTimeTitleLabel.sizeToFit()
        launchTimeTitleLabel.frame = CGRect(
            x: 16,
            y: view.safeAreaInsets.top + 16,
            width: launchTimeTitleLabel.frame.width,
            height: launchTimeTitleLabel.frame.height
        )
        launchTimeTitleLabel.sizeToFit()
        
        launchTimeLabel.sizeToFit()
        launchTimeLabel.frame = CGRect(
            x: 16,
            y: launchTimeTitleLabel.frame.maxY + 16,
            width: launchTimeLabel.frame.width,
            height: launchTimeLabel.frame.height
        )
        launchTimeLabel.sizeToFit()
        
        appearanceTimeTitleLabel.sizeToFit()
        appearanceTimeTitleLabel.frame = CGRect(
            x: 16,
            y: launchTimeLabel.frame.maxY + 32,
            width: appearanceTimeTitleLabel.frame.width,
            height: appearanceTimeTitleLabel.frame.height
        )
        appearanceTimeTitleLabel.sizeToFit()
        
        appearanceTimeLabel.sizeToFit()
        appearanceTimeLabel.frame = CGRect(
            x: 16,
            y: appearanceTimeTitleLabel.frame.maxY + 16,
            width: launchTimeLabel.frame.width,
            height: appearanceTimeLabel.frame.height
        )
        appearanceTimeLabel.sizeToFit()
        
        pushButton.sizeToFit()
        pushButton.frame = CGRect(
            x: (view.bounds.width - pushButton.frame.width) / 2,
            y: view.bounds.height - pushButton.frame.height - 32,
            width: pushButton.frame.width,
            height: pushButton.frame.height
        )
        pushButton.sizeToFit()
    }
    
    private func showLaunchTime() {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d, yyyy 'at' HH:mm:ss aaa"
        launchTimeLabel.text = formatter.string(from: Date())
            .description
        launchTimeLabel.sizeToFit()
    }
    
    private func showAppearanceTime() {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d, yyyy 'at' HH:mm:ss aaa"
        appearanceTimeLabel.text = formatter.string(from: Date())
            .description
        appearanceTimeLabel.sizeToFit()
    }
    
    // MARK: - Actions
    
    @objc private func updateButtonTapped() {
        showAppearanceTime()
    }
    
    @objc private func pushButtonTapped() {
        navigationController?.pushViewController(SecondViewController(), animated: true)
    }
    
}

