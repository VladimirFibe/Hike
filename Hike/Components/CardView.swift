import SwiftUI

struct CardView: View {
    var body: some View {
        ZStack {
            CustomBackgroundView()
            VStack {
                header
                content
            }
        }
        .frame(height: 570)
        .padding(.horizontal)
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
