//
//  MagazineRepositoryData.swift
//  DataSource
//
//  Created by 신동규 on 8/19/24.
//

import Domain
import Combine
import SwiftUI

public final class MagazineRepositoryData: MagazineRepository {
    public var magazines: AnyPublisher<[Image], Never> { $_magazines.eraseToAnyPublisher() }
    @Published var _magazines: [Image] = []
    
    public var thumbnails: AnyPublisher<[Image], Never> { $_thumbnails.eraseToAnyPublisher() }
    @Published var _thumbnails: [Image] = []
    
    public init() {
        _magazines = [
            .init("magazine-front-cover", bundle: nil),
            .init("magazine-back-cover", bundle: nil)
        ]
        
        _thumbnails = [
            .init("thumb-magazine-front-cover", bundle: nil),
            .init("thumb-magazine-back-cover", bundle: nil)
        ]
    }
}
