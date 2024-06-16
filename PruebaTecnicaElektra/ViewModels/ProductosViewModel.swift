//
//  ProductosViewModel.swift
//  PruebaTecnicaElektra
//
//  Created by Moises Sanchez on 16/06/24.
//

import Foundation
import SwiftUI

class ProductosViewModel: ObservableObject {
    @Published var productos: [Producto] = []
    @Published var selectedProducto: Producto? = nil
    @Published var errorMessage: String? = nil
    @Published var isLoading: Bool = false
    
    private let productoService: ProductoService
    
    init(productoService: ProductoService) {
        self.productoService = productoService
    }
    
    func fetchProductos() {
        self.isLoading = true
        productoService.fetchProductos { result in
            DispatchQueue.main.async {
                self.isLoading = false
                switch result {
                case .success(let productos):
                    self.productos = productos.resultado.productos
                    self.errorMessage = nil
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                }
            }
        }
    }
}

