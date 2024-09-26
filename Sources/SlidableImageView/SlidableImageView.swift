import SwiftUI

struct SlidableImageView: View {
    var image1: Image
    var image2: Image
    
    @State private var sliderValue: CGFloat = 0.5
    
    var body: some View {
        ZStack {
            // Image 1 (below)
            image1
                .resizable()
                .scaledToFit()
                .cornerRadius(15)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            
            // Image 2 (above) with mask
            image2
                .resizable()
                .scaledToFit()
                .cornerRadius(15)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                
                .mask(
                    GeometryReader { geometry in
                        Rectangle()
                            .size(width: geometry.size.width * sliderValue, height: geometry.size.height)
                    }
                )
            
            VStack {
                Spacer()
                ZStack {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(height: 250)
                    
                    // Custom knob
                    GeometryReader { geometry in
                        Circle()
                            .frame(width: 50, height: 50)
                            .foregroundColor(.gray.opacity(0.6))
                            .overlay(
                                Image(systemName: "arrow.left.arrow.right")
                                    .foregroundColor(.white)
                                    .font(.title)
                            )
                            .position(
                                x: geometry.size.width * sliderValue,
                                y: geometry.size.height / 2
                            )
                            .gesture(
                                DragGesture(minimumDistance: 0)
                                    .onChanged { value in
                                        let sliderPosition = min(max(0, value.location.x / geometry.size.width), 1)
                                        sliderValue = sliderPosition
                                    }
                            )
                    }
                    .frame(height: 250)
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
