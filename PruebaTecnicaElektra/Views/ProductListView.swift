//
//  ProductListView.swift
//  PruebaTecnicaElektra
//
//  Created by Moises Sanchez on 16/06/24.
//

import SwiftUI

struct ProductosListView: View {
    @EnvironmentObject var viewModel: ProductosViewModel
    
    var body: some View {
        List(viewModel.productos,  id: \.id) { producto in

            Button(action: {
                viewModel.selectedProducto = producto
                viewModel.showProduct = false
                
            }) {
                ProductCardView(producto: producto)
            }
        }
        .navigationTitle("Productos")
        .onAppear {
            viewModel.fetchProductos()
        }
    }
}


