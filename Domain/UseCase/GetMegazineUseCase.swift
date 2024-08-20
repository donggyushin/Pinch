//
//  GetMegazineUseCase.swift
//  Domain
//
//  Created by 신동규 on 8/19/24.
//

import SwiftUI

public final class GetMegazineUseCase {
    private let magazineRepository: MagazineRepository
    
    public init(magazineRepository: MagazineRepository) {
        self.magazineRepository = magazineRepository
    }
    
    public func execute() -> Image? {
        magazineRepository.getMagazine()
    }
}
