//
//  KeyboardViewController.swift
//  KeyboardExtension
//
//  Created by ryokosuge on 2020/02/26.
//  Copyright © 2020 ryokosuge. All rights reserved.
//

import UIKit
import FluctSDK

class KeyboardViewController: UIInputViewController {

    private var adViews: [FSSAdView] = []
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        
        // Add custom view sizing constraints here
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .center
        stackView.axis = .vertical
        stackView.spacing = 8

        view.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 16.0),
            stackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16.0),
            view.bottomAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 16.0),
            view.rightAnchor.constraint(equalTo: stackView.rightAnchor, constant: 16.0)
        ])

        let adView1 = FSSAdView(groupId: "1000111980", unitId: "1000177335", adSize: FSSAdSize320x50)
        adView1.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(adView1)
        adViews.append(adView1)

        let adView2 = FSSAdView(groupId: "1000111980", unitId: "1000177335", adSize: FSSAdSize320x50)
        adView2.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(adView2)
        adViews.append(adView2)

        let adView3 = FSSAdView(groupId: "1000111980", unitId: "1000177335", adSize: FSSAdSize320x50)
        adView3.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(adView3)
        adViews.append(adView3)

        NSLayoutConstraint.activate([
            adView1.widthAnchor.constraint(equalToConstant: 320),
            adView2.widthAnchor.constraint(equalToConstant: 320),
            adView3.widthAnchor.constraint(equalToConstant: 320),
            adView1.heightAnchor.constraint(equalToConstant: 50),
            adView2.heightAnchor.constraint(equalToConstant: 50),
            adView3.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        adViews.forEach { $0.loadAd() }
    }

}
