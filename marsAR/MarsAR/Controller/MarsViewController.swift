//
//  ViewController.swift
//  MarsAR
//
//  Created by Ray Porras on 2/17/18.
//  Copyright © 2018 Ray Porras. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class MarsViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set up navigation bar items
        setupNavigationBarItems()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Create a new scene
        let mars = SCNSphere(radius: 0.5)
        
        let material = SCNMaterial()
        
        material.diffuse.contents = UIImage(named: "art.scnassets/mars.jpg")
        
        mars.materials = [material]
        
        let node = SCNNode()
        
        node.position = SCNVector3(x: 0, y: 0, z: -1.5)
        
        node.geometry = mars
        
        sceneView.scene.rootNode.addChildNode(node)
        
        sceneView.autoenablesDefaultLighting = true
        
        node.runAction(SCNAction.repeatForever(SCNAction.rotateBy(
            x: 0,
            y: 1,
            z: 0,
            duration: 5))
        )
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        
        //A9 and up chip compatibility
        let configuration = ARWorldTrackingConfiguration()
        
        //A8 and down chip compatibility
        //let configuration = AROrientationTrackingConfiguration()
        
        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
    
    // Set up navigation bar
    // Navigation bar
    private func setupNavigationBarItems() {
        
        let addEarthButton = UIButton(type: .system)
        addEarthButton.setImage(#imageLiteral(resourceName: "addEarthIcon"), for: .normal)
        addEarthButton.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        addEarthButton.imageView?.contentMode = .scaleAspectFit
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: addEarthButton)
    }
    
    func addEarth() {
        
        //Add earth to scene
        let earth = SCNSphere(radius: 5.0)
        
        let earthMaterial = SCNMaterial()
        
        earthMaterial.diffuse.contents = UIImage(named: "art.scnassets/earth.jpg")
        
        earth.materials = [earthMaterial]
        
        let earthNode = SCNNode()
        
        earthNode.position = SCNVector3(x: 0, y: 0, z: -20.0)
        
        earthNode.geometry = earth
        
        sceneView.scene.rootNode.addChildNode(earthNode)
        
        earthNode.runAction(SCNAction.repeatForever(SCNAction.rotateBy(
            x: 0,
            y: 1,
            z: 0,
            duration: 5))
        )
        
    }
    

}
