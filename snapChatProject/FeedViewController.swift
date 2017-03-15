//
//  FeedViewController.swift
//  snapChatProject
//
//  Created by Junyu Wang on 3/14/17.
//  Copyright © 2017 org.iosdecal. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var feedTableView: UITableView!
    var imageToPost: UIImage?
    var selectedThread: String?
    @IBOutlet weak var postToFeedLabel: UILabel!
    @IBOutlet weak var postFooterView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        feedTableView.delegate = self
        feedTableView.dataSource = self
        feedTableView.tableFooterView = postFooterView
        postToFeedLabel.text = "Select a feed to post to"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = feedTableView.dequeueReusableCell(withIdentifier: "FeedCell",
                                                     for: indexPath) as! FeedTableViewCell
        cell.feedNameLabel.text = threadNames[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return threadNames.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedThread = threadNames[indexPath.row]
        postToFeedLabel.text = "Post to: \(selectedThread!)"
    }
    
    @IBAction func postButtonWasPressed(_ sender: UIButton) {
        if let image = imageToPost {
            if let thread = selectedThread {
                let snapPost = SnapPost(with: image, from: "Junyu Wang")
                threads[thread]?.append(snapPost)
                showAlert(thread)
            }
        }
    }
    
    func showAlert(_ threadName: String) {
        let alertController = UIAlertController(title: "Posted!", message:
            "Your image has been posted to \(threadName)", preferredStyle: UIAlertControllerStyle.alert)
        alertController.addAction(UIAlertAction(title: "Ok",
                                                style: UIAlertActionStyle.default,
                                                handler: {
                                                    (alert) in
                                                    _ = self.navigationController?.popViewController(animated: true)
        }))
        
        self.present(alertController, animated: true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
