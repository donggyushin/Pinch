//
//  ContentView.swift
//  Pinch
//
//  Created by 신동규 on 8/19/24.
//

import SwiftUI
import Domain
import DataSource
import Presentation

struct ContentView: View {
    var body: some View {
        NavigationStack {
            Presentation.PinchView(magazineRepository: MagazineRepositoryData())
        }
    }
}

#Preview {
    ContentView()
}
