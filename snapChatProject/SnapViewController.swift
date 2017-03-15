//
//  SnapViewController.swift
//  snapChatProject
//
//  Created by Junyu Wang on 3/14/17.
//  Copyright © 2017 org.iosdecal. All rights reserved.
//

import UIKit

class SnapViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var snapTableView: UITableView!
    var selectedSnapPost: SnapPost?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        snapTableView.delegate = self
        snapTableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.snapTableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return threadNames.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let snaps = threads[threadNames[section]] {
            return snaps.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return threadNames[section]
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let thread = threadNames[indexPath.section]
        if let posts = threads[thread] {
            selectedSnapPost = posts[indexPath.row]
            if selectedSnapPost?.readStatus == false {
                selectedSnapPost?.readStatus = true
                performSegue(withIdentifier: "SnapToSnapPostViewSegue", sender: self)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SnapCell", for: indexPath) as! SnapTableViewCell
        let thread = threadNames[indexPath.section]
        if let posts = threads[thread] {
            let post = posts[indexPath.row]
            cell.readStatusImageView.image = post.readStatus == true ? #imageLiteral(resourceName: "read") : #imageLiteral(resourceName: "unread")
            cell.userLabel.text = post.postedBy!
            let interval = Date().timeIntervalSince(post.postedTime!)
            cell.postedTimeLabel.text = "\(Int(interval / 60)) minutes ago"
        }
        return cell
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            if identifier == "SnapToSnapPostViewSegue" {
                if let destination = segue.destination as? SnapPostViewController {
                    destination.postToView = selectedSnapPost
                }
            }
        }
    }

}
