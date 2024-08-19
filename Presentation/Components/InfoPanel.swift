//
//  InfoPanel.swift
//  Presentation
//
//  Created by 신동규 on 8/19/24.
//

import SwiftUI

struct InfoPanel: View {
    
    let scale: CGFloat
    let offset: CGSize
    
    @State private var isShowingPanel: Bool = false
    
    init(
        scale: CGFloat,
        offset: CGSize
    ) {
        self.scale = scale
        self.offset = offset
    }
    
    var body: some View {
        HStack {
            Image(systemName: "circle.circle")
                .symbolRenderingMode(.hierarchical)
                .resizable()
                .frame(width: 30, height: 30)
                .onTapGesture {
                    isShowingPanel.toggle()
                }
            
            Spacer(minLength: 20)
            
            HStack {
                Image(systemName: "arrow.up.left.and.arrow.down.right")
                Text("\(scale)")
                
                Spacer()
                
                Image(systemName: "arrow.left.and.right")
                Text("\(offset.width)")
                
                Spacer()
                
                Image(systemName: "arrow.up.and.down")
                Text("\(offset.height)")
            }
            .font(.caption2)
            .padding(.horizontal)
            .padding(.vertical, 12)
            .background {
                RoundedRectangle(cornerRadius: 8)
                    .fill(.thinMaterial.opacity(0.8))
            }
            .opacity(isShowingPanel ? 1 : 0)
            .animation(.spring, value: isShowingPanel)
        }
    }
}

#Preview {
    InfoPanel(scale: 1, offset: .zero)
        .preferredColorScheme(.dark)
}
