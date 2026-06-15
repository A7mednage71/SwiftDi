//
//  DIApp.swift
//  DI
//
//  Created by Ahmed Nageh on 14/06/2026.
//

import SwiftUI

@main
struct DIApp: App {
    
    private let factory = AppAssembler.shared.resolveMovieListViewFactory()
    
    var body: some Scene {
        
        WindowGroup {
//            let viewModel = AppAssembler.shared.resolveMovieViewModel()
//            MovieListView(viewModel: viewModel)
            
            factory.makeMovieListView()
        }
    }
}
