//
//  ViewController.swift
//  sillysong
//
//  Created by Rahul Dhiman on 05/10/17.
//  Copyright © 2017 Rahul Dhiman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var nameView: UITextField!
    @IBOutlet weak var lyricsView: UITextView!
    @IBOutlet weak var viewLL: UIButton!
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    
    @IBAction func reset(_ sender: Any) {
        nameView.text?.removeAll()
        lyricsView.text.removeAll()
        nameView.autocapitalizationType = .words
    }
    
    
    @IBAction func viewLL(_ sender: Any) {
        if let name = nameView.text {
            lyricsView.text = lyricsForName(lyricsTemplate: bananaFanaTemplate, fullName: name)
        }
        
    }
    
    
    
    let bananaFanaTemplate = [
        "<FULL_NAME>, <FULL_NAME>, Bo B<SHORT_NAME>",
        "Banana Fana Fo F<SHORT_NAME>",
        "Me My Mo M<SHORT_NAME>",
        "<FULL_NAME>"].joined(separator: "\n")

    func lyricsForName(lyricsTemplate: String, fullName: String) -> String {
        
        let shortshort = shortname(name: fullName)
        
        let strshow = lyricsTemplate.replacingOccurrences(of: "<FULL_NAME>", with: fullName).replacingOccurrences(of: "<SHORT_NAME>", with: shortshort)
        
        return strshow
    }
    
    
    
    func shortname(name:String)->String{
        
        var lowername = name.lowercased()
        
        
        
        let vowels : [Character] = ["a","e","i","o","u"]
        
        for index in vowels {
            if lowername.characters.first != index{
                lowername.remove(at: lowername.startIndex)
                break
        }
        }
        
      return lowername
    }

}

