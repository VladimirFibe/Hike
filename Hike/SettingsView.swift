import SwiftUI

struct SettingsView: View {
    private let alternateAppIcons: [String] = [
      "AppIcon-MagnifyingGlass",
      "AppIcon-Map",
      "AppIcon-Mushroom",
      "AppIcon-Camera",
      "AppIcon-Backpack",
      "AppIcon-Campfire"
    ]
    var body: some View {
        List {
            header
            icons
            about
        }
    }
    var header: some View {
        Section {
            HStack {
                Image(systemName: "laurel.leading")
                    .font(.system(size:80, weight: .black))

                VStack(spacing: -10) {
                    Text("Hike")
                        .font(.system(size: 66, weight: .black))
                    Text("Editors' Choice")
                        .fontWeight(.medium)
                }

                Image(systemName: "laurel.trailing")
                    .font(.system(size:80, weight: .black))
            }
            .frame(maxWidth: .infinity)
            .foregroundStyle(
                LinearGradient(
                    colors: [
                        .colorGreenLight,
                        .colorGreenMedium,
                        .colorGreenDark
                    ],
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
            .padding(.top, 8)

            VStack(spacing: 8.0) {
                Text("Where can you find \nperfect tracks?")
                  .font(.title2)
              .fontWeight(.heavy)

                Text("The hike which looks gorgeous in photos but is even better once you are actually there. The hike that you hope to do again someday. \nFind the best day hikes in the app.")
                  .font(.footnote)
                  .italic()

                Text("Dust off the boots! It's time for a walk.")
                  .fontWeight(.heavy)
                  .foregroundStyle(Color.colorGreenMedium)
            }
            .multilineTextAlignment(.center)
            .padding(.bottom, 16)
        }
    }
    var icons: some View {
        Section(header: Text("Alternative Icons")) {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12.0) {
                    ForEach(alternateAppIcons.indices, id: \.self) { index in
                        Button(action: {
                            print(alternateAppIcons[index])
                            UIApplication.shared.setAlternateIconName(alternateAppIcons[index]) {
                                if let error = $0 {
                                    print("Failed request to update the app's icon: \(String(describing: error.localizedDescription))")
                                } else {
                                    print("Success! You have changed the app's icon to \(alternateAppIcons[index])")
                                }
                            }
                        }) {
                            Image("\(alternateAppIcons[index])-Preview")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 80, height: 80)
                            .cornerRadius(16)
                        }
                        .buttonStyle(.borderless)
                    }
                }
            }
            .padding(.top, 12)

            Text("Choose your favourite app icon from the collection above.")
              .frame(minWidth: 0, maxWidth: .infinity)
              .multilineTextAlignment(.center)
              .foregroundStyle(.secondary)
              .font(.footnote)
              .padding(.bottom, 12)
        }
    }
    var about: some View {
        Section(
          header: Text("ABOUT THE APP"),
          footer: HStack {
            Spacer()
            Text("Copyright © All right reserved.")
            Spacer()
          }
            .padding(.vertical, 8)
        ) {
          CustomListRowView(rowLabel: "Application", rowIcon: "apps.iphone", rowContent: "HIKE", rowTintColor: .blue)

          CustomListRowView(rowLabel: "Compatibility", rowIcon: "info.circle", rowContent: "iOS, iPadOS", rowTintColor: .red)

          CustomListRowView(rowLabel: "Technology", rowIcon: "swift", rowContent: "Swift", rowTintColor: .orange)

          CustomListRowView(rowLabel: "Version", rowIcon: "gear", rowContent: "1.0", rowTintColor: .purple)

          CustomListRowView(rowLabel: "Developer", rowIcon: "ellipsis.curlybraces", rowContent: "John Doe", rowTintColor: .mint)

          CustomListRowView(rowLabel: "Designer", rowIcon: "paintpalette", rowContent: "Robert Petras", rowTintColor: .pink)

          CustomListRowView(rowLabel: "Website", rowIcon: "globe", rowTintColor: .indigo, rowLinkLabel: "Credo Acedemy", rowLinkDestination: "https://credo.academy")

        } //: SECTION
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}

struct CustomListRowView: View {
  @State var rowLabel: String
  @State var rowIcon: String
  @State var rowContent: String? = nil
  @State var rowTintColor: Color
  @State var rowLinkLabel: String? = nil
  @State var rowLinkDestination: String? = nil

  var body: some View {
    LabeledContent {
      // Content
      if rowContent != nil {
        Text(rowContent!)
          .foregroundColor(.primary)
          .fontWeight(.heavy)
      } else if (rowLinkLabel != nil && rowLinkDestination != nil) {
        Link(rowLinkLabel!, destination: URL(string: rowLinkDestination!)!)
          .foregroundColor(.pink)
          .fontWeight(.heavy)
      } else {
        EmptyView()
      }
    } label: {
      // Label
      HStack {
        ZStack {
          RoundedRectangle(cornerRadius: 8)
            .frame(width: 30, height: 30)
            .foregroundColor(rowTintColor)
          Image(systemName: rowIcon)
            .foregroundColor(.white)
            .fontWeight(.semibold)
        }

        Text(rowLabel)
      }
    }
  }
}
