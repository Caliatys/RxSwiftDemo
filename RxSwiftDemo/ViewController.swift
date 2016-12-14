//
//  ViewController.swift
//  RxSwiftDemo
//
//  Created by Casey Liss on 13/12/16.
//  Copyright © 2016 Casey Liss. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {

    // MARK: Outlets
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var button: UIButton!
    
    // MARK: ivars
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        self.button.rx.tap
            .debug("button tap")
            .scan(0) { (priorValue, _) in
                return priorValue + 1
            }
            .debug("after scan")
            .subscribe(onNext: { [unowned self] currentCount in
                self.label.text = "You have tapped that button \(currentCount) times."
            })
            .addDisposableTo(disposeBag)
    }

}


