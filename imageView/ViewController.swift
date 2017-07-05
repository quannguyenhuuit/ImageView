//
//  ViewController.swift
//  imageView
//
//  Created by quanmacos on 7/5/17.
//  Copyright © 2017 quanmacos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var txtURL: UITextField!
    @IBOutlet weak var imgVew: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnLoadClick(_ sender: Any) {
        if txtURL.text != "" {
            LoadImage(url: txtURL.text!)
        }
    }
    
    func LoadImage(url: String) {
        let url: URL = URL(string: url)!
        
        (URLSession(configuration: .default)).dataTask(with: url, completionHandler: { (data, respone, error) in
            if let imageData = data {
                DispatchQueue.main.async { () -> Void in
                    self.imgVew.image = UIImage(data: imageData)
                }
            } else {
                let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alertController.addAction(action)
                
                self.present(alertController, animated: true, completion: nil)
            }
        }).resume()
    }
}
