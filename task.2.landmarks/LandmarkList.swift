//
//  LandmarkList.swift
//  task.2.landmarks
//
//  Created by Juuso on 27.1.2020.
//  Copyright © 2020 Juuso. All rights reserved.
//

import SwiftUI

struct LandmarkList: View {
    var body: some View {
        NavigationView {
            List(landmarkData) { landmark in
                NavigationLink(destination: ContentView(landmark: landmark)) {
                    LandmarkRow(landmark: landmark)
                }
            }
            .navigationBarTitle(Text("Landmarks"))
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
         ForEach(["iPhone SE", "iPhone XS Max"], id: \.self) { deviceName in
                   LandmarkList()
                       .previewDevice(PreviewDevice(rawValue: deviceName))
                        .previewDisplayName(deviceName)
               }
    }
}
