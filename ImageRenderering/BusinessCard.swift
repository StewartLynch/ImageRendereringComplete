//
// Created for ImageRenderering
// by Stewart Lynch on 2022-08-15
// Using Swift 5.0
//
// Follow me on Twitter: @StewartLynch
// Subscribe on YouTube: https://youTube.com/StewartLynch
//

import SwiftUI
import PhotosUI

struct BusinessCard: View {
    @StateObject var imagePicker = ImagePicker()
    @State private var renderedImage: Image?
    @State private var name = ""
    @State private var company = ""
    @State private var email = ""
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    VStack {
                        TextField("Name", text: $name)
                        TextField("Company", text: $company)
                        TextField("Email Address", text: $email)
                            .keyboardType(.emailAddress)
                            .textInputAutocapitalization(.never)
                    }
                    .textFieldStyle(.roundedBorder)
                    cardView
                    Divider()
                    Spacer()
                    VStack {
                        Button("Render Image") {
                            let renderer = ImageRenderer(content: cardView)
                            renderer.scale = 3
                            if let image = renderer.cgImage {
                                renderedImage = Image(decorative: image, scale: 1.0)
                            }
                        }
                        .buttonStyle(.borderedProminent)
                        RenderedImageView(renderedImage: $renderedImage)
                            .navigationTitle("Business Card")
                        if let renderedImage {
                            ShareLink(item: renderedImage, preview: SharePreview("My card", image: renderedImage))
                        }
                    }
                }
                .padding()
            }
        }
    }
    var cardView: some View {
        HStack {
            PhotosPicker(selection: $imagePicker.imageSelection, matching: .images, photoLibrary: .shared()) {
                if let image = imagePicker.image {
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 75, height: 75)
                        .clipShape(Circle())
                } else {
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 75, height: 75)
                }
            }

            VStack(alignment: .leading, spacing: 15) {
                Text(name)
                    .font(.title3).bold()
                Text(company)
                Text(email)
            }
            Spacer()
        }
        .padding()
        .frame(width: 325, height: 150)
//        .background(RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 1))
        .background(RoundedRectangle(cornerRadius: 10)
            .fill(Color(.systemBackground))
            .overlay {
                RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 1)
            }
        )
    }
}

struct BusinessCard_Previews: PreviewProvider {
    static var previews: some View {
        BusinessCard()
    }
}



