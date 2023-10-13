//
//  ContactView.swift
//  MeCard
//
//  Created by Gustavo Gonzalez on 10/12/23.
//

import SwiftUI

struct ContactView: View {
    @Binding var showDropdown: Bool
    @Binding var selectedView: String

    var body: some View {
        ZStack {
            Text("Contact View Content")
            MenuButton(showDropdown: $showDropdown)
        }
    }
} 
