//
//  SearchNavView.swift
//  CognizantDemo
//
//  Created by Jalp on 15/04/2021.
//

import SwiftUI

// Native navigation bar from UIKit
struct SearchNavView<Content: View>: UIViewControllerRepresentable {
    @Binding var text: String
    var content: () -> Content

    // Required method to implement UINavigationController
    func makeUIViewController(context: Context) -> UINavigationController {
        let navigationController = UINavigationController(rootViewController: context.coordinator.rootViewController)
        navigationController.navigationBar.prefersLargeTitles = true
        navigationController.navigationBar.topItem?.title = "Animals"
        
        navigationController.navigationBar.topItem?.hidesSearchBarWhenScrolling = false
        
        
        context.coordinator.searchController.searchBar.placeholder = "Search Animals"
        context.coordinator.searchController.searchBar.delegate = context.coordinator
        
        return navigationController
    }
    
    // Update the coordinator
    func updateUIViewController(_ uiViewController: UINavigationController, context: Context) {
        context.coordinator.update(content: content())
    }
    
    // Initialise the coordinator
    func makeCoordinator() -> Coordinator {
        Coordinator(content: content(), searchText: $text)
    }
    
    // Coordinator class that handles the search bar query
    class Coordinator: NSObject, UISearchBarDelegate {
        @Binding var text: String
        let rootViewController: UIHostingController<Content>
        let searchController = UISearchController(searchResultsController: nil)
        
        init(content: Content, searchText: Binding<String>) {
            rootViewController = UIHostingController(rootView: content)
            searchController.searchBar.autocapitalizationType = .none
            searchController.obscuresBackgroundDuringPresentation = false
            rootViewController.navigationItem.searchController = searchController
            
            _text = searchText
        }
        
        func update(content: Content) {
            rootViewController.rootView = content
            rootViewController.view.setNeedsDisplay()
        }
        
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            text = searchText
        }
        
        func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
            // perform query
        }
        
        func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
            // dismiss search bar
        }
    }
    
}

