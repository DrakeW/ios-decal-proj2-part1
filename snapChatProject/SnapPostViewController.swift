//
//  SnapPostViewController.swift
//  snapChatProject
//
//  Created by Junyu Wang on 3/14/17.
//  Copyright © 2017 org.iosdecal. All rights reserved.
//

import UIKit

class SnapPostViewController: UIViewController {

    @IBOutlet weak var snapPostButtonView: UIButton!
    var postToView: SnapPost?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let post = postToView {
            if let image = post.image {
                snapPostButtonView.setImage(image.withRenderingMode(.alwaysOriginal), for: .normal)
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func snapPostButtonWasPressed(_ sender: UIButton) {
        dismiss(animated: false, completion: nil)
    }
}
