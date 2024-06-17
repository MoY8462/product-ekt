//
//  ProductCardView.swift
//  PruebaTecnicaElektra
//
//  Created by Moises Sanchez on 16/06/24.
//

import SwiftUI

import SwiftUI

struct ProductCardView: View {
    let producto: Producto
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            if let url = URL(string: producto.urlImagenes.first ?? "") {
                AsyncImage(url: url) { image in
                    image.resizable()
                        .aspectRatio(contentMode: .fill)
                } placeholder: {
                    Color.gray
                }
                .frame(width: 300, height: 200)
                .clipped() // Asegura que la imagen no se desborde de su marco
                .cornerRadius(10)
            }
            
            Text(producto.nombre)
                .font(.headline)
                .foregroundColor(.black)
            
            Text("Precio: \(producto.precioFinal, specifier: "%.2f")")
                .font(.subheadline)
                .foregroundColor(.gray)
            
            Text("Categoría: \(producto.codigoCategoria.rawValue)")
                .font(.footnote)
                .foregroundColor(.secondary)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
        .frame(maxWidth: .infinity) // Asegura que el ancho del card se ajuste al contenedor
    }
}
