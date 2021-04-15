//
//  ListView.swift
//  CognizantDemo
//
//  Created by Jalp on 15/04/2021.
//

import SwiftUI

// List view that displays a list of animals
struct ListView: View {
    @State var searchQuery: String = ""
    // Hardcoded list of animals that are of type Animal
    let animals =
        [
            "Barracuda","Bat","Bear","Beaver","Bee","Bison","Boar",
            "Butterfly","Camel","Capybara","Caribou","Cassowary",
            "Cat","Caterpillar","Elephant",
            "Elk","Goshawk","Grasshopper","Grouse","Guanaco",
            "Gull","Hamster","Hare","Hawk","Hedgehog","Heron",
            "Kingfisher","Leopard","Lion",
            "Llama","Lobster","Locust","Loris",
            "Louse","Lyrebird","Magpie","Mallard",
            "Swan","Wolverine","Wombat","Woodcock",
            "Woodpecker","Worm","Wren","Yak", "Zebra"
        ]
    var body: some View {
        SearchNavView(text: $searchQuery) {
            List {
                ForEach(animals.filter {
                    searchQuery.isEmpty || $0.localizedStandardContains(searchQuery)
                }, id: \.self) { animal in
                    Text(animal)
                }
            }
            .navigationTitle(Text("Animals"))
        }.ignoresSafeArea(.all)
    }
}


struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
