//
//  ContentView.swift
//  Wristalyze
//
//  Created by Nicholas Hartman on 6/24/22.
//

import SwiftUI
import CoreData

struct ContentView: View {
    var body: some View {
        Text("Select an item")
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
