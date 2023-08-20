import SwiftUI

struct CardView: View {
    @State private var imageNumber = 1
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
                    print("ta[")
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
            Circle()
                .fill(
                    LinearGradient(
                        colors: [
                            .colorIndigoMedium,
                            .colorSalmonLight
                        ],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .frame(width: 256, height: 256)
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
