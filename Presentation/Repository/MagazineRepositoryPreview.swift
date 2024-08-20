//
//  MagazineRepositoryPreview.swift
//  Presentation
//
//  Created by 신동규 on 8/19/24.
//

import Combine
import Domain
import SwiftUI

final class MagazineRepositoryPreview: MagazineRepository {
    public var magazines: AnyPublisher<[Image], Never> { $_magazines.eraseToAnyPublisher() }
    @Published var _magazines: [Image] = []
    
    public var thumbnails: AnyPublisher<[Image], Never> { $_thumbnails.eraseToAnyPublisher() }
    @Published var _thumbnails: [Image] = []
    
    public init() {
        _magazines = [
            .init("magazine-front-cover", bundle: .init(identifier: "com.donggyu.Presentation")),
            .init("magazine-back-cover", bundle: .init(identifier: "com.donggyu.Presentation"))
        ]
        
        _thumbnails = [
            .init("thumb-magazine-front-cover", bundle: .init(identifier: "com.donggyu.Presentation")),
            .init("thumb-magazine-back-cover", bundle: .init(identifier: "com.donggyu.Presentation"))
        ]
    }
    
    public func getMagazine() -> Image? {
        _magazines.first
    }
}
