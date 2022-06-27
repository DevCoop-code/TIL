//
//  CircleImage.swift
//  SwiftUI_1
//
//  Created by HanGyo Jeong on 2022/06/27.
//

import SwiftUI

struct CircleImage: View {
    var body: some View {
        Image("choonsik")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 150, height: 150, alignment: .center)
            .clipShape(Circle())
            .overlay{
                Circle().stroke(.white, lineWidth: 4)
            }                       // Add Border
            .shadow(radius: 7)      // Add Shadow
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage()
    }
}
