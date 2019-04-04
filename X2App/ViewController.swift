//
//  ViewController.swift
//  X2App
//
//  Created by Roman on 3/25/19.
//  Copyright © 2019 Roman. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet private weak var pathToFileTextField: NSTextField!
    @IBOutlet private weak var x2EmpiricLabel: NSTextField!
    @IBOutlet private weak var x2CriticLabel: NSTextField!

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override var representedObject: Any? {
        didSet {
        }
    }

    @IBAction func calculate(_ sender: Any) {
        let path = URL(fileURLWithPath: pathToFileTextField.stringValue)

        guard let data = try? FileManager.default.parse(file: path) else { print("can't read file"); return }
        var distr = PoissonDirstibution(from: data)
        print(distr.data)
        distr.regroup()
        dump(distr)
    }

}

