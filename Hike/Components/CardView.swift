import SwiftUI

struct CardView: View {
    var body: some View {
        ZStack {
            CustomBackgroundView()
            VStack {
                title
                content
            }
        }
        .frame(height: 570)
        .padding(.horizontal)
    }
    var title: some View {
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
            Image("image-1")
                .resizable()
                .scaledToFit()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
    }
}
