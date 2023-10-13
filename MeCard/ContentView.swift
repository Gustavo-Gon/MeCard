//
//  ContentView.swift
//  MeCard, a app that show case myself
//
//  Created by Gustavo Gonzalez on 10/12/23.
//
import SwiftUI

struct ContentView: View {
    @State private var showDropdown = false
    @State private var selectedView: String = "Home"
    @State private var showMore1: Bool = false
    @State private var showMore2: Bool = false
    @State private var showMore3: Bool = false

    var body: some View {
        ZStack {
            // Main Content
            switch selectedView {
            case "Home":
                ZStack {
                    // Static Content
                    VStack(alignment: .center) {
                        Image("MyPhoto")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 300)
                            .clipShape(Circle())
                            .shadow(radius: 10)
                            .padding(.top)
                            .layoutPriority(1) // Higher priority for layout
                        Spacer() // Pushes the image to the top
                    }
                    

                    // Dynamic Content
                    ScrollView {
                        VStack(alignment: .center, spacing: 20) {
                            // Leave space for the image
                            Spacer().frame(height: 330)

                            ExpandableView(title: "Introduction", showMore: $showMore1, content: """
                                I'm a dedicated Computer Science student from Bellevue College with a passion for software and mobile application development.
                                """)

                            ExpandableView(title: "Experience", showMore: $showMore2, content: """
                                My academic journey is coupled with hands-on experience, having collaborated on Agile teams to create innovative Android/iOS applications.
                                """)

                            ExpandableView(title: "Additional Skills", showMore: $showMore3, content: """
                                Beyond the classroom and development environment, I've honed my skills in customer-centric roles, blending technical expertise with effective communication. Always eager to embrace new challenges, I'm driven by a relentless pursuit of technological excellence and continuous learning.
                                """)
                        }
                        .padding()  // Padding around all the content
                    }
                }
                .background(Color(#colorLiteral(red: 0.9411764706, green: 0.9725490196, blue: 1, alpha: 1)).edgesIgnoringSafeArea(.all)) // Alice Blue)
                MenuButton(showDropdown: $showDropdown)
            case "Portfolio":
                PortfolioView(showDropdown: $showDropdown, selectedView: $selectedView)
            case "Contact":
                ContactView(showDropdown: $showDropdown, selectedView: $selectedView)
            default:
                Text("Unknown view")
            }

            // Dropdown Menu System
            if showDropdown {
                DropdownMenu(selectedView: $selectedView, showDropdown: $showDropdown)
            }
        }
        .background(Color(#colorLiteral(red: 0.9411764706, green: 0.9725490196, blue: 1, alpha: 1)).edgesIgnoringSafeArea(.all)) // Alice Blue)
    }
}

struct ExpandableView: View {
    var title: String
    @Binding var showMore: Bool
    var content: String

    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.title)
                .padding(.bottom, 5)
                .onTapGesture {
                    withAnimation {
                        showMore.toggle()
                    }
                }

            if showMore {
                Text(content)
                    .font(Font.custom("Helvetica Neue", size: 18))
                    .transition(.opacity)
                    .animation(.easeIn)
            }
        }
        .padding(.vertical)
    }
}


struct MenuButton: View {
    @Binding var showDropdown: Bool

    var body: some View {
        VStack(alignment: .leading) {
            Button(action: {
                withAnimation {
                    self.showDropdown.toggle()
                }
            }) {
                Image(systemName: "line.horizontal.3")
                    .padding()
            }
            .background(Color(#colorLiteral(red: 0.9411764706, green: 0.9725490196, blue: 1, alpha: 1)).edgesIgnoringSafeArea(.all))
            .position(x: 30, y: 45)
        }
    }
}

struct DropdownMenu: View {
    @Binding var selectedView: String
    @Binding var showDropdown: Bool

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Button("Home") {
                selectedView = "Home"
                showDropdown = false
            }
            Button("Portfolio") {
                selectedView = "Portfolio"
                showDropdown = false
            }
            Button("Contact") {
                selectedView = "Contact"
                showDropdown = false
            }
        }
        .padding(.top, 10)
        .background(Color(#colorLiteral(red: 0.9411764706, green: 0.9725490196, blue: 1, alpha: 1)).opacity(0.0).edgesIgnoringSafeArea(.all))
        .cornerRadius(5)
        .shadow(radius: 10)
        .position(x: 100, y: 100)
    }
}
