//
//  ProductDetailView.swift
//  PruebaTecnicaElektra
//
//  Created by Moises Sanchez on 16/06/24.
//

import SwiftUI

struct ProductDetailView: View {
    let producto: Producto
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) { // Ajusta el espaciado entre elementos
                if let url = URL(string: producto.urlImagenes.first ?? "") {
                    AsyncImage(url: url) { image in
                        image.resizable()
                            .aspectRatio(contentMode: .fit)
                    } placeholder: {
                        Color.gray
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.bottom, 20) // Add padding to the bottom of the image
                    
                }
                
                Text(producto.nombre)
                    .font(.largeTitle)
                
                Text("Precio: \(producto.precioFinal, specifier: "%.2f")")
                    .font(.title2)
                
                Text("Categoría: \(producto.codigoCategoria.rawValue)")
                    .font(.title3)
            }
            .padding()
        }
        .navigationTitle("Detalle del Producto")
    }
}

