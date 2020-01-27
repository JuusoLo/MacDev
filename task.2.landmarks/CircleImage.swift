//
//  CircleImage.swift
//  task_landmarks
//
//  Created by Juuso on 13.1.2020.
//  Copyright © 2020 Juuso. All rights reserved.
//

import SwiftUI

struct CircleImage: View {
    var image: Image

    var body: some View {
        image
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 4))
            .shadow(radius: 10)
    }
}

struct CircleImage_Preview: PreviewProvider {
    static var previews: some View {
        CircleImage(image: Image("turtlerock"))
    }
}
