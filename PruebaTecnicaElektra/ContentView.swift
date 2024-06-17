//
//  ContentView.swift
//  PruebaTecnicaElektra
//
//  Created by Moises Sanchez on 16/06/24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: ProductosViewModel

    var body: some View {
            NavigationView {
                VStack {
                    if let errorMessage = viewModel.errorMessage {
                        Text(errorMessage)
                            .foregroundColor(.red)
                            .padding()
                    } 
                    
                    
                    NavigationLink(destination: ProductosListView()) {
                                        Text("Mostrar Productos")
                                            .padding()
                                            .background(Color.blue)
                                            .foregroundColor(.white)
                                            .cornerRadius(8)
                                    }
                                    
                                    if let producto = viewModel.selectedProducto {
                                        ProductDetailView(producto: producto)
                                    }
                    
                    
                    
                }
                .navigationTitle("Productos")
            }
        }
}

#Preview {
    ContentView()
}
