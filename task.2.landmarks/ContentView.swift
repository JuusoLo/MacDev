//
//  ContentView.swift
//  task.2.landmarks
//
//  Created by Juuso on 27.1.2020.
//  Copyright © 2020 Juuso. All rights reserved.
//


import SwiftUI

struct ContentView: View {
    var landmark: Landmark
    var body: some View {
        VStack {
            MapView(coordinate: landmark.locationCoordinate)
                .edgesIgnoringSafeArea(.top)
                .frame(height: 300)

            CircleImage(image: landmark.image)
                .offset(y: -130)
                .padding(.bottom, -130)

            VStack(alignment: .leading) {
                Text(landmark.name)
                    .font(.title)

                HStack(alignment: .top) {
                    Text(landmark.park)
                        .font(.subheadline)
                    Spacer()
                    Text(landmark.state)
                        .font(.subheadline)
                }
            }
            .padding()

            Spacer()
        }
    .navigationBarTitle(Text(landmark.name), displayMode: .inline)
    }
}

struct ContentView_Preview: PreviewProvider {
    static var previews: some View {
        ContentView(landmark: landmarkData[0])
    }
}
