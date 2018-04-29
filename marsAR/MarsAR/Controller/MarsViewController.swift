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
        
        node.runAction(SCNAction.rotateBy(
            x: 0,
            y: 5,
            z: 0,
            duration: 2800)
        )
        
        //Add sun to scene
        let sun = SCNSphere(radius: 5.0)
        
        let sunMaterial = SCNMaterial()
        
        sunMaterial.diffuse.contents = UIImage(named: "art.scnassets/sun.jpg")
        
        sun.materials = [sunMaterial]
        
        let sunNode = SCNNode()
        
        sunNode.position = SCNVector3(x: 0, y: 0, z: -20.0)
        
        sunNode.geometry = sun
        
        sceneView.scene.rootNode.addChildNode(sunNode)
        
        sunNode.runAction(SCNAction.rotateBy(
            x: 0,
            y: 2.5,
            z: 0,
            duration: 2800)
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
    

}
