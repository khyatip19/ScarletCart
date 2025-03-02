//
//  ContentView.swift
//  ScarletCart
//
//  Created by Sravya Pogiri on 3/1/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color(red: 235/255, green: 253/255, blue: 242/255)
                            .edgesIgnoringSafeArea(.all)
            VStack {
                Text("Welcome")
                    .font(Font.custom("Aclonica", size: 52))
                    .padding(.vertical, 132)
                NavigationLink(destination: ContentView())
                {
                    Text("Log In")
                        .font(Font.custom("Aclonica", size: 38))
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .cornerRadius(10)
                }
                .font(.body)
                .buttonStyle(.borderedProminent)
                .tint(Color(UIColor(red: 0.09, green: 0.29, blue: 0.17, alpha: 1)))
                .padding(.horizontal, 35)
                .padding(.vertical, 5)
            }
            .padding()
        }
        
    }
}

#Preview {
    ContentView()
}
