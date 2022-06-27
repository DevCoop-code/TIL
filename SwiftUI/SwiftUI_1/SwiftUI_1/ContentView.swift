//
//  ContentView.swift
//  SwiftUI_1
//
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(){
            MapView()
                .ignoresSafeArea(edges: .top)
                .frame(height: 300)
            CircleImage()
                .offset(y: -130)
                .padding(.bottom, -130)
            VStack(alignment: .leading) {
                
                Text("Choonsik")
                    .font(.largeTitle)
                    .foregroundColor(.black)
                HStack {
                    Text("With a Cool WaterMelon")
                    Spacer()
                    Text("Hot Summer")
                }
                .font(.subheadline)
                .foregroundColor(.secondary)
                
                Divider()
                
                Text("About Choonsik Favor")
                    .font(.title2)
                Text("Actually Choonsik loves Sweet potato")
                    .font(.subheadline)
            }
            .padding()
            
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
