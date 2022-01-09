//
//  SplashVC.swift
//  ALSE
//
//  Created by Nick George on 6/2/20.
//  Copyright © 2020 SimpleDev Studios. All rights reserved.
//

import UIKit
import Network
import Firebase

class SplashVC: UIViewController {
    //MARK: VARIABLES
    let group = DispatchGroup()
    
    //MARK: OUTLETS
    @IBOutlet weak var versionLbl: UILabel!
    @IBOutlet weak var buildLbl: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    //MARK:LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        progressBar.setProgress(0.0, animated: true)
        
        let dictionary = Bundle.main.infoDictionary!
        let version = dictionary["CFBundleShortVersionString"] as! String
        let build = dictionary["CFBundleVersion"] as! String
        
        versionLbl.text = "Version: \(version)"
        buildLbl.text = "Build: \(build)"
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let alertController = UIAlertController(title: "Beta Information", message: "This app is currently in beta. Data may be periodically erased without any backup. Please backup your data until the final release", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: {action in
            self.load()
        })
        alertController.addAction(action)
        present(alertController, animated: true)
    }
    
    //MARK:ACTIONS
    
    //MARK:FUNCTIONS
    func checkConnectivity() {
        let nMonitor = NetworkMonitor.init()
        nMonitor.startMonitoring()
        if nMonitor.isReachable || nMonitor.isReachableOnCellular {
            
        } else {
            
        }
    }
    
    @objc func statusManager(_ notification: Notification) {
        checkConnectivity()
    }
    
    
    func load() {
        progressBar.setProgress(0.0, animated: true)
        
        let taskGroup = DispatchGroup()
        
        taskGroup.enter()
        checkConnectivity()
        progressBar.setProgress(0.2, animated: true)
        taskGroup.leave()
        
        //        taskGroup.enter()
        //        setupRemoteConfigDefaults()
        //        progressBar.setProgress(0.4, animated: true)
        //        taskGroup.leave()
        
        //        taskGroup.enter()
        //        fetchRemoteConfig()
        //        progressBar.setProgress(0.6, animated: true)
        //        taskGroup.leave()
        
        //        taskGroup.enter()
        //        getStatus()
        //        progressBar.setProgress(0.8, animated: true)
        //        taskGroup.leave()
        
        taskGroup.notify(queue: .main) {
            print("done")
            self.progressBar.setProgress(1, animated: true)
            if Auth.auth().currentUser != nil {
                self.performSegue(withIdentifier: "splachToMain", sender: self)
            } else {
                self.performSegue(withIdentifier: "splashToWelcome", sender: self)
            }
        }
    }
}
