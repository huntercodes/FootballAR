//
//  Coordinator.swift
//  FootballAR
//
//  Created by hunter downey on 3/24/23.
//

import Foundation
import ARKit
import RealityKit
import Combine

class Coordinator: NSObject, ARSessionDelegate {
    
    weak var view: ARView?
    var cancellable: AnyCancellable?
   
    @objc func handleTap(_ recognizer: UITapGestureRecognizer) {
        guard let view = self.view else {
            return
        }
        
        guard view.scene.anchors.first(where: { $0.name == "SpaceStationAnchor" }) == nil else {
            return
        }
        
        let tapLocation = recognizer.location(in: view)
        
        let results = view.raycast(
            from: tapLocation,
            allowing: .estimatedPlane,
            alignment: .horizontal
        )
        
        if let result = results.first {
            let anchor = AnchorEntity(raycastResult: result)
            
            cancellable = ModelEntity.loadAsync(named: "SpaceStation")
                .sink(receiveCompletion: { completion in
                    if case let .failure(error) = completion {
                        print("Unable to load model \(error)")
                    }
                    self.cancellable?.cancel()
                }, receiveValue: { entity in
                    entity.scale *= 0.25
                    anchor.name = "SpaceStationAnchor"
                    anchor.addChild(entity)
                    entity.playAnimation(entity.availableAnimations[0].repeat(duration: .infinity), transitionDuration: 1.25, startsPaused: false)
                })
            
            view.scene.addAnchor(anchor)
        }
    }
    
}
