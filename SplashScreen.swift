//
//  SplashScreen.swift
//  MeCard
//
//  Created by Gustavo Gonzalez on 10/12/23.
//

import SwiftUI

struct SplashScreen: View {
    @State private var isActive = false
    @State private var helloOffset: CGFloat = 0
    @State private var welcomeOffset: CGFloat = 0
    
    var body: some View {
        ZStack {
            Color(red: 181/255, green: 220/255, blue: 240/255).edgesIgnoringSafeArea(.all) // Updated Color using RGB values

            VStack {
                Text("Hello")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .padding(.bottom, 20)
                    .offset(x: helloOffset)

                Text("Welcome")
                    .font(.title)
                    .offset(x: welcomeOffset)
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                withAnimation {
                    helloOffset = -UIScreen.main.bounds.width
                    welcomeOffset = UIScreen.main.bounds.width
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    isActive = true
                }
            }
        }
        .fullScreenCover(isPresented: $isActive) {
            ContentView()
        }
    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}
