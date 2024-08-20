//
//  Drawer.swift
//  Presentation
//
//  Created by 신동규 on 8/20/24.
//

import SwiftUI
import Domain

struct Drawer: View {
    
    let images: [Thumbnail]
    let select: ((Image) -> ())?
    
    @Binding var expanded: Bool
    
    init(
        expanded: Binding<Bool>,
        images: [Image],
        select: ((Image) -> ())?
    ) {
        self._expanded = expanded
        self.images = images.map({ .init(id: UUID().uuidString, image: $0) })
        self.select = select
    }
    
    var body: some View {
        HStack(spacing: 40) {
            Image(systemName: expanded ? "chevron.right" : "chevron.left")
                .resizable()
                .scaledToFit()
                .frame(height: 20)
                .onTapGesture {
                    expanded.toggle()
                }
            
            HStack(spacing: 12) {
                ForEach(images) { image in
                    image.image
                        .resizable()
                        .scaledToFit()
                        .frame(height: 80)
                        .clipShape(RoundedRectangle(cornerRadius: 4))
                        .onTapGesture {
                            select?(image.image)
                        }
                }
            }
        }
        .padding(.horizontal)
        .padding(.vertical, 8)
        .background {
            RoundedRectangle(cornerRadius: 12)
                .fill(.ultraThinMaterial)
                .shadow(color: .black, radius: 4, x: 2, y: 2)
        }
    }
}

#Preview {
    
    let repository = MagazineRepositoryPreview()
    let images = repository._thumbnails
    
    return Drawer(expanded: .constant(true), images: images, select: nil)
        .preferredColorScheme(.dark)
}
