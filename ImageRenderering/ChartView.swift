//
// Created for ImageRenderering
// by Stewart Lynch on 2022-08-15
// Using Swift 5.0
//
// Follow me on Twitter: @StewartLynch
// Subscribe on YouTube: https://youTube.com/StewartLynch
//

import SwiftUI
import Charts

struct ChartView: View {
    @State private var renderedImage: Image?
    @State private var viewSize = CGSize.zero
    var body: some View {
        NavigationStack {
            VStack {
                barChart
                    .readSize { newValue in
                        viewSize = newValue
                    }
                Divider()
                Spacer()
                VStack {
                    Button("Render Image") {
                        let renderer = ImageRenderer(content: barChart
                            .frame(width: viewSize.width, height: viewSize.height)
                        )
                        renderer.scale = 3
                        if let image = renderer.cgImage {
                            renderedImage = Image(decorative: image, scale: 1.0)
                        }
                    }
                    .buttonStyle(.borderedProminent)
                    RenderedImageView(renderedImage: $renderedImage)
                        .navigationTitle("Sample Chart")
                    if let renderedImage {
                        ShareLink(item: renderedImage, preview: SharePreview("My card", image: renderedImage))
                    }
                }
            }
        }
    }
    var barChart: some View {
        Chart {
            BarMark(x: .value("Day", "Mon"), y: .value("Min", 20))
            BarMark(x: .value("Day", "Tues"), y: .value("Min", 65))
                .foregroundStyle(.red)
            BarMark(x: .value("Day", "Wed"), y: .value("Min", 45))
        }
        .padding()
        .background(Color(.systemBackground))
        .padding()
    }
}



struct ChartView_Previews: PreviewProvider {
    static var previews: some View {
        ChartView()
    }
}
