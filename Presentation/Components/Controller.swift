//
//  Controller.swift
//  Presentation
//
//  Created by 신동규 on 8/19/24.
//

import SwiftUI

struct Controller: View {
    
    let zoomOut: (() -> ())?
    let reset: (() -> ())?
    let zoomIn: (() -> ())?
    
    var body: some View {
        HStack(spacing: 20) {
            Button {
                zoomOut?()
            } label: {
                Image(systemName: "minus.magnifyingglass")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .foregroundStyle(.accent)
            }
            
            Button {
                reset?()
            } label: {
                Image(systemName: "arrow.up.left.and.down.right.magnifyingglass")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .foregroundStyle(.accent)
            }
            
            Button {
                zoomIn?()
            } label: {
                Image(systemName: "plus.magnifyingglass")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .foregroundStyle(.accent)
            }
        }
        .padding(.horizontal)
        .padding(.vertical, 8)
        .background {
            RoundedRectangle(cornerRadius: 8)
                .fill(.thinMaterial.opacity(0.8))
        }
    }
}

#Preview {
    Controller(zoomOut: nil, reset: nil, zoomIn: nil)
        .preferredColorScheme(.dark)
}
