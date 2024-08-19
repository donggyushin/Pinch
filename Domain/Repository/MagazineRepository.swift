//
//  MagazineRepository.swift
//  Domain
//
//  Created by 신동규 on 8/19/24.
//

import Combine
import SwiftUI

public protocol MagazineRepository {
    var magazines: AnyPublisher<[Image], Never> { get }
    var thumbnails: AnyPublisher<[Image], Never> { get }
}
