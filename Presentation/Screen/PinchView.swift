//
//  PinchView.swift
//  Presentation
//
//  Created by 신동규 on 8/19/24.
//

import SwiftUI
import Domain

public struct PinchView: View {
    
    @State private var isAnimating: Bool = false
    @State private var magazineScale: CGFloat = 1
    @StateObject var viewModel: PinchViewModel
    
    
    public init(
        magazineRepository: MagazineRepository
    ) {
        _viewModel = .init(wrappedValue: .init(magazineRepository: magazineRepository))
    }
    
    public var body: some View {
        ZStack {
            if let magazine = viewModel.selectedMagazine {
                magazine
                    .resizable()
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .shadow(radius: 12, x: 2, y: 2)
                    .padding()
                    .opacity(isAnimating ? 1 : 0)
                    .scaleEffect(magazineScale)
                    .onTapGesture(count: 2) {
                        if magazineScale == 1 {
                            magazineScale = 5
                        } else {
                            magazineScale = 1
                        }
                    }
                    .animation(.linear(duration: 10), value: isAnimating)
                    .animation(.spring, value: magazineScale)
            } else {
                Text("No Selected Magazine")
            }
        }
        .navigationTitle("Pinch & Zoom")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            isAnimating = true
        }
    }
}

#Preview {
    PinchView(magazineRepository: MagazineRepositoryPreview())
        .preferredColorScheme(.dark)
}
