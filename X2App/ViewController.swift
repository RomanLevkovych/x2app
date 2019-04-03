//
//  ViewController.swift
//  X2App
//
//  Created by Roman on 3/25/19.
//  Copyright © 2019 Roman. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var pathToFileTextField: NSTextField!

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override var representedObject: Any? {
        didSet {
        }
    }

    @IBAction func calculate(_ sender: Any) {
        let path = URL(fileURLWithPath: pathToFileTextField.stringValue)
        guard let data = try? String(contentsOf: path) else {
            print("An error occured opening file")
            return
        }

        print(try! FileManager.default.parse(file: path))
    }

}

