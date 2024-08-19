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
    @State private var magazineOffset: CGSize = .zero
    @StateObject var viewModel: PinchViewModel
    
    func reset() {
        magazineScale = 1
        magazineOffset = .zero
    }
    
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
                    .opacity(isAnimating ? 1 : 0)
                    .offset(magazineOffset)
                    .scaleEffect(magazineScale)
                    .shadow(radius: 12, x: 2, y: 2)
                    .padding()
                    .animation(.linear(duration: 1), value: isAnimating)
                    .animation(.spring, value: magazineScale)
                    .animation(.spring(duration: 0.5), value: magazineOffset)
                    .onTapGesture(count: 2) {
                        if magazineScale == 1 {
                            magazineScale = 5
                        } else {
                            reset()
                        }
                    }
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                magazineOffset = value.translation
                            }
                            .onEnded { _ in
                                if magazineScale <= 1 {
                                    reset()
                                }
                            }
                    )
                    .gesture(
                        MagnificationGesture()
                            .onChanged { value in
                                magazineScale = value
                            }
                            .onEnded { _ in
                                if magazineScale < 1 {
                                    reset()
                                } else if magazineScale > 5 {
                                    magazineScale = 5
                                }
                            }
                    )
                    .onAppear {
                        isAnimating = true
                    }
            } else {
                Text("No Selected Magazine")
            }
            
            VStack {
                InfoPanel(scale: magazineScale, offset: magazineOffset)
                    .animation(.default, value: magazineScale)
                    .animation(.default, value: magazineOffset)
                Spacer()
                
                Controller {
                    magazineScale = max(1, magazineScale - 1)
                } reset: {
                    reset()
                } zoomIn: {
                    magazineScale = min(5, magazineScale + 1)
                }

            }
            .padding()
        }
        .navigationTitle("Pinch & Zoom")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    PinchView(magazineRepository: MagazineRepositoryPreview())
        .preferredColorScheme(.dark)
}
