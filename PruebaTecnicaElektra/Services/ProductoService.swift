//
//  ProductoService.swift
//  PruebaTecnicaElektra
//
//  Created by Moises Sanchez on 16/06/24.
//

import Foundation

class ProductoService {
    private let dataSource: ProductoDataSource
    
    init(dataSource: ProductoDataSource) {
        self.dataSource = dataSource
    }
    
    func fetchProductos(completion: @escaping (Result<GetProducto, ProductoError>) -> Void) {
        dataSource.fetchProductos { result in
            completion(result)
        }
    }
    
    
}

