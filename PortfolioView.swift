//
//  PortfolioView.swift
//  MeCard
//
//  Created by Gustavo Gonzalez on 10/12/23.
//

import SwiftUI

struct PortfolioView: View {
    @Binding var showDropdown: Bool
    @Binding var selectedView: String

    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            MenuButton(showDropdown: $showDropdown)
            
            Text("Check out my Projects")
                .font(Font.custom("HelveticaNeue-Bold", size: 30))
                .padding(.top, 50)

            Link("My GitHub", destination: URL(string: "https://github.com/Gustavo-Gon")!)
                .font(Font.custom("Helvetica Neue", size: 28))
                .padding()
            
            Text("Personal Website: Coming Soon!")
                .font(Font.custom("Helvetica Neue", size: 20))
                .padding()


        }
        .padding(.horizontal)
    }

}
