import SwiftUI

struct CardView: View {
    @State private var imageNumber = 1
    @State private var isShowingSheet = false
    private func randomImage() {
        let random = Int.random(in: 1...5)
        imageNumber = random == imageNumber ? random == 5 ? 1 : random + 1 : random
    }

    var body: some View {
        ZStack {
            CustomBackgroundView()
            VStack {
                header
                content
                footer
            }
        }
        .frame(height: 570)
        .padding(.horizontal)
        .sheet(isPresented: $isShowingSheet) {
            SettingsView()
                .presentationDragIndicator(.visible)
                .presentationDetents([.medium, .large])
        }
    }

    var footer: some View {
        Button(action: randomImage) {
            Text("Explore More")
              .font(.title2)
              .fontWeight(.heavy)
              .foregroundStyle(
                LinearGradient(
                  colors: [
                    .colorGreenLight,
                    .colorGreenMedium
                  ],
                  startPoint: .top,
                  endPoint: .bottom
                )
              )
              .shadow(color: .black.opacity(0.25), radius: 0.25, x: 1, y: 2)
        }
        .buttonStyle(GradientButton())
    }

    var header: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Hiking")
                    .fontWeight(.black)
                    .font(.system(size: 52))
                    .foregroundStyle(
                        LinearGradient(
                            colors: [
                                .colorGrayLight,
                                .colorGrayMedium
                            ],
                            startPoint: .top,
                            endPoint: .bottom
                        )
                )
                Spacer()
                Button {
                    isShowingSheet.toggle()
                } label: {
                    CustomButtonView()
                }

            }
            Text("Fun and enjoyable outdoor activity for friends and families.")
              .multilineTextAlignment(.leading)
              .italic()
              .foregroundColor(.colorGrayMedium)
        }
        .padding(.horizontal, 30)
    }
    
    var content: some View {
        ZStack {
            CustomCircleView()
            Image("image-\(imageNumber)")
                .resizable()
                .scaledToFit()
                .animation(.default, value: imageNumber)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
    }
}
