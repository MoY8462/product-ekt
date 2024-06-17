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
        VStack(alignment: .leading, spacing: 8) { // Añade un espaciado entre elementos
            if let url = URL(string: producto.urlImagenes.first ?? "") {
                AsyncImage(url: url) { image in
                    image.resizable() // Hace la imagen redimensionable
                        .aspectRatio(contentMode: .fill) // Cambia a fill para mantener el aspecto llenando el espacio
                } placeholder: {
                    Color.gray // Un placeholder para cuando la imagen está cargando
                }
                .frame(width: 300, height: 200) // Limita el tamaño de la imagen
                .clipped() // Asegura que la imagen no se desborde de su marco
                .cornerRadius(10) // Opcional: redondea las esquinas de la imagen
            }
            
            Text(producto.nombre)
                .font(.headline)
            
            Text("Precio: \(producto.precioFinal, specifier: "%.2f")")
                .font(.subheadline)
            
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
