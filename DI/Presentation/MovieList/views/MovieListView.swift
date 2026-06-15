//
//  MovieListView.swift
//  DI
//
//  Created by Ahmed Nageh on 14/06/2026.
//

import SwiftUI

struct MovieListView: View {
    
    @StateObject private var viewModel: MovieViewModel
    
    init(viewModel: MovieViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        NavigationView {
            Group {
                if viewModel.isLoading {
                    ProgressView("Loading Movies...")
                } else {
                    List(viewModel.movies) { movie in
                        VStack(alignment: .leading) {
                            Text(movie.title)
                                .font(.headline)
                            Text(movie.year)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                    }
                }
            }
            .navigationTitle("Movies")
            .onAppear {
                viewModel.getMovies()
            }
        }
    }
}
