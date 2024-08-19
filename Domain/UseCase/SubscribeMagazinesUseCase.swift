//
//  SubscribeMagazinesUseCase.swift
//  Domain
//
//  Created by 신동규 on 8/19/24.
//

import Combine
import SwiftUI

public final class SubscribeMagazinesUseCase {
    private let magazineRepository: MagazineRepository
    
    public init(magazineRepository: MagazineRepository) {
        self.magazineRepository = magazineRepository
    }
    
    public func execute() -> AnyPublisher<[Image], Never> {
        magazineRepository.magazines
    }
}
