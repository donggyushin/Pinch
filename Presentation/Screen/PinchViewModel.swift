//
//  PinchViewModel.swift
//  Presentation
//
//  Created by 신동규 on 8/19/24.
//

import Combine
import Domain
import Foundation
import SwiftUI

final class PinchViewModel: ObservableObject {
    
    @Published var selectedMagazine: Image?
    
    @Published var magazines: [Image] = []
    @Published var thumbnails: [Image] = []
    
    
    private let subscribeMagazinesUseCase: SubscribeMagazinesUseCase
    private let subscribeThumbnailsUseCase: SubscribeThumbnailsUseCase
    private let getMegazineUseCase: GetMegazineUseCase
    
    init(
        magazineRepository: MagazineRepository
    ) {
        subscribeMagazinesUseCase = .init(magazineRepository: magazineRepository)
        subscribeThumbnailsUseCase = .init(magazineRepository: magazineRepository)
        getMegazineUseCase = .init(magazineRepository: magazineRepository)
        
        bind()
        
        Task {
            await config()
        }
    }
    
    private func bind() {
        subscribeMagazinesUseCase
            .execute()
            .receive(on: DispatchQueue.main)
            .assign(to: &$magazines)
        
        subscribeThumbnailsUseCase
            .execute()
            .receive(on: DispatchQueue.main)
            .assign(to: &$thumbnails)
    }
    
    @MainActor
    private func config() {
        selectedMagazine = getMegazineUseCase.execute()
    }
}
