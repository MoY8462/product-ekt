//
//  ContentView.swift
//  PruebaTecnicaElektra
//
//  Created by Moises Sanchez on 16/06/24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: ProductosViewModel
    @State private var showAlert = false

    var body: some View {
            NavigationView {
                VStack {
                    //if let errorMessage = viewModel.errorMessage {
                    //    Text(errorMessage)
                    //        .foregroundColor(.red)
                    //        .padding()
                    //}
                    if let producto = viewModel.selectedProducto {
                        ProductDetailView(producto: producto)
                    }
                    
                    Button("Mostrar Productos") {
                        viewModel.showProduct = true
                    }
                    .background(NavigationLink(destination: ProductosListView(), isActive: $viewModel.showProduct) { EmptyView() }.hidden())
                    
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
                    
                }
                .navigationTitle("Productos")
            }
        }
}

#Preview {
    ContentView()
}
