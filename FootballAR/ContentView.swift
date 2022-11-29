//
//  ContentView.swift
//  FootballAR
//
//  Created by hunter downey on 10/7/22.
//

import SwiftUI
import RealityKit

struct ContentView : View {
    var body: some View {
        ARViewContainer()
            .edgesIgnoringSafeArea(.all)
    }
}

// MARK: - UIViewRepresentable

struct ARViewContainer: UIViewRepresentable {
    func makeUIView(context: Context) -> ARView {
        let arView = ARView(frame: .zero)
        
        let anchor = AnchorEntity(
            .plane(
                .horizontal,
                classification: .any,
                minimumBounds: .zero
            )
        )
        
        // MARK: - Materials
        let fieldMaterial = SimpleMaterial(
            color: .green,
            roughness: 3,
            isMetallic: false
        )
        
        let distanceMarkerMaterial = SimpleMaterial(
            color: .white,
            roughness: 4,
            isMetallic: false
        )
        
        let endzoneMaterial = SimpleMaterial(
            color: .red,
            roughness: 7,
            isMetallic: false
        )
        
        let firstDownMaterial = SimpleMaterial(
            color: .yellow,
            roughness: 1,
            isMetallic: true
        )
        
        let lineOfScrimMaterial = SimpleMaterial(
            color: .black,
            roughness: 1,
            isMetallic: true
        )
        
        
        // MARK: - Models
        let layerField = ModelEntity(
            mesh: .generatePlane(width: 0.274, depth: 0.604),
            materials: [distanceMarkerMaterial]
        )
        layerField.position = simd_make_float3(0, -0.00001, 0)
        
        let field = ModelEntity(
            mesh: .generatePlane(width: 0.27, depth: 0.6),
            materials: [fieldMaterial]
        )
        field.position = simd_make_float3(0, 0, 0)
        
        let midfieldLogo = ModelEntity(
            mesh: .generatePlane(width: 0.027, depth: 0.027, cornerRadius: 100),
            materials: [distanceMarkerMaterial]
        )
        midfieldLogo.position = simd_make_float3(0, 0.00001, 0)
        
        let midfieldMarker = ModelEntity(
            mesh: .generatePlane(width: 0.2699, depth: 0.002),
            materials: [distanceMarkerMaterial]
        )
        midfieldMarker.position = simd_make_float3(0, 0.00001, 0)
        
        let lineOfScrimMarker = ModelEntity(
            mesh: .generatePlane(width: 0.2699, depth: 0.002),
            materials: [distanceMarkerMaterial]
        )
        lineOfScrimMarker.position = simd_make_float3(0, 0.00001, -0.125)
        
        let firstDownMarker = ModelEntity(
            mesh: .generatePlane(width: 0.2699, depth: 0.002),
            materials: [distanceMarkerMaterial]
        )
        firstDownMarker.position = simd_make_float3(0, 0.00001, -0.075)
        
        let rightEndzoneMarker = ModelEntity(
            mesh: .generatePlane(width: 0.2699, depth: 0.002),
            materials: [distanceMarkerMaterial]
        )
        rightEndzoneMarker.position = simd_make_float3(0, 0.0001, 0.25)
        
        let leftEndzoneMarker = ModelEntity(
            mesh: .generatePlane(width: 0.2699, depth: 0.002),
            materials: [distanceMarkerMaterial]
        )
        leftEndzoneMarker.position = simd_make_float3(0, 0.0001, -0.25)
        
        let tenYardMarker = ModelEntity(
            mesh: .generatePlane(width: 0.2699, depth: 0.002),
            materials: [distanceMarkerMaterial]
        )
        tenYardMarker.position = simd_make_float3(0, 0.00001, -0.2)
        
        let twentyYardMarker = ModelEntity(
            mesh: .generatePlane(width: 0.2699, depth: 0.002),
            materials: [distanceMarkerMaterial]
        )
        twentyYardMarker.position = simd_make_float3(0, 0.00001, -0.15)
        
        let thirtyYardMarker = ModelEntity(
            mesh: .generatePlane(width: 0.2699, depth: 0.002),
            materials: [distanceMarkerMaterial]
        )
        thirtyYardMarker.position = simd_make_float3(0, 0.00001, -0.1)
        
        let fourtyYardMarker = ModelEntity(
            mesh: .generatePlane(width: 0.2699, depth: 0.002),
            materials: [distanceMarkerMaterial]
        )
        fourtyYardMarker.position = simd_make_float3(0, 0.00001, -0.05)
        
        let otherFourtyYardMarker = ModelEntity(
            mesh: .generatePlane(width: 0.2699, depth: 0.002),
            materials: [distanceMarkerMaterial]
        )
        otherFourtyYardMarker.position = simd_make_float3(0, 0.00001, 0.05)
        
        let otherThirtyYardMarker = ModelEntity(
            mesh: .generatePlane(width: 0.2699, depth: 0.002),
            materials: [distanceMarkerMaterial]
        )
        otherThirtyYardMarker.position = simd_make_float3(0, 0.00001, 0.1)
        
        let otherTwentyYardMarker = ModelEntity(
            mesh: .generatePlane(width: 0.2699, depth: 0.002),
            materials: [distanceMarkerMaterial]
        )
        otherTwentyYardMarker.position = simd_make_float3(0, 0.00001, 0.15)
        
        let otherTenYardMarker = ModelEntity(
            mesh: .generatePlane(width: 0.2699, depth: 0.002),
            materials: [distanceMarkerMaterial]
        )
        otherTenYardMarker.position = simd_make_float3(0, 0.00001, 0.2)
        
        let fieldGoalOne = try! Entity.load(named: "fieldGoal")
        fieldGoalOne.setScale([0.00013, 0.00013, 0.00013], relativeTo: fieldGoalOne)
        fieldGoalOne.setOrientation(
            simd_quatf(
                ix: 0.0,
                iy: 1.5,
                iz: 0.0,
                r: 0.0
            ),
            relativeTo: fieldGoalOne
        )
        fieldGoalOne.position = simd_make_float3(0, 0, 0.3)

        let fieldGoalTwo = try! Entity.load(named: "fieldGoal")
        fieldGoalTwo.setScale([0.00013, 0.00013, 0.00013], relativeTo: fieldGoalTwo)
        fieldGoalTwo.setOrientation(
            simd_quatf(
                ix: 0.0,
                iy: 0.0,
                iz: 0.0,
                r: 0.0
            ),
            relativeTo: fieldGoalTwo
        )
        fieldGoalTwo.position = simd_make_float3(0, 0, -0.3)
        
        let endzoneOne = ModelEntity(
            mesh: .generatePlane(width: 0.2699, depth: 0.05),
            materials: [endzoneMaterial]
        )
        endzoneOne.position = simd_make_float3(0, 0.00001, 0.275)
        
        let endzoneTwo = ModelEntity(
            mesh: .generatePlane(width: 0.2699, depth: 0.05),
            materials: [endzoneMaterial]
        )
        endzoneTwo.position = simd_make_float3(0, 0.00001, -0.275)
        
        
        // MARK: - Add Childs / Return View
        anchor.addChild(layerField)
        anchor.addChild(field)
        anchor.addChild(midfieldLogo)
        anchor.addChild(midfieldMarker)
        anchor.addChild(lineOfScrimMarker)
        anchor.addChild(firstDownMarker)
        anchor.addChild(rightEndzoneMarker)
        anchor.addChild(leftEndzoneMarker)
        anchor.addChild(tenYardMarker)
        anchor.addChild(twentyYardMarker)
        anchor.addChild(thirtyYardMarker)
        anchor.addChild(fourtyYardMarker)
        anchor.addChild(otherFourtyYardMarker)
        anchor.addChild(otherThirtyYardMarker)
        anchor.addChild(otherTwentyYardMarker)
        anchor.addChild(otherTenYardMarker)
        anchor.addChild(fieldGoalOne)
        anchor.addChild(fieldGoalTwo)
        anchor.addChild(endzoneOne)
        anchor.addChild(endzoneTwo)
        arView.scene.anchors.append(anchor)
        
        return arView
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {
        
    }
}

// MARK: - Previews
#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
