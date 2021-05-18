//
//  ContentView.swift
//  TKUIViewRepresentable
//
//  Created by Eren  Çelik on 18.05.2021.
//

import SwiftUI

struct ContentView: View {
    let fruitsArray : [String] = ["elma","armut","kiraz","çilek","portakal","muz","karpuz","avakado","nar"]
    @State private var searchedText : String = ""
    
    var body: some View {
        NavigationView{
            VStack{
                SearchBarView(text: $searchedText, placeholder: "Aramak İstediğiniz Kelimeyi giriniz")
                List{
                    ForEach(fruitsArray.filter { self.searchedText.isEmpty ?
                                true : $0.lowercased().contains(self.searchedText.lowercased()) }, id : \.self) { fruit in
                        Text(fruit)
                    }
                }
            }
            .navigationTitle("Meyveler")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
