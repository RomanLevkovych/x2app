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
    @IBOutlet weak var alphaTextField: NSTextField!
    @IBOutlet weak var resultLabel: NSTextField!
    
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
        var distr = distributionFactory(from: data)
        print(distr.lambda)
        //dump(distr)
        distr.regroup()
        //dump(distr)

        let pathTable = Bundle.main.url(forResource: "table", withExtension: "csv")
        var x2Critic = try! String(contentsOf: pathTable!)
            .split(separator: "\n")
            .compactMap{
                $0.split(separator: " ")
                    .compactMap{ Double($0)
                }
        }
        let alpha = Double(alphaTextField.stringValue)!
        let val = x2Critic[0].firstIndex(of: alpha)
        let empiric = distr.chiSquaredEmpiric()
        let critic = x2Critic[distr.degreesOfFreedom-1][val!]

        x2CriticLabel.stringValue = "\(critic)"
        x2EmpiricLabel.stringValue = "\(empiric)"
        resultLabel.stringValue = empiric < critic ? "Приймаємо" : "Відкидаємо"
    }

}

