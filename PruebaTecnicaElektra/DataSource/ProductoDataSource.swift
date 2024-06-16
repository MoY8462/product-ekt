//
//  ProductoDataSource.swift
//  PruebaTecnicaElektra
//
//  Created by Moises Sanchez on 16/06/24.
//

import Foundation

enum ProductoError: Error {
    case invalidURL
    case networkError(Error)
    case httpError(Int)
    case decodingError(Error)
    case unknownError
    
    var localizedDescription: String {
        switch self {
        case .invalidURL:
            return Constants.ErrorMessages.invalidURL
        case .networkError(let error):
            return error.localizedDescription
        case .httpError(let statusCode):
            return "\(Constants.ErrorMessages.networkError) \(statusCode)"
        case .decodingError(let error):
            return "\(Constants.ErrorMessages.decodingError) \(error.localizedDescription)"
        case .unknownError:
            return Constants.ErrorMessages.unknownError
        }
    }
}

protocol ProductoDataSource {
    func fetchProductos(completion: @escaping (Result<GetProducto, ProductoError>) -> Void)
    
}

class ProductoAPIDataSource: ProductoDataSource {
    func fetchProductos(completion: @escaping (Result<GetProducto, ProductoError>) -> Void) {
        guard let url = URL(string: Constants.API.baseURL) else {
            completion(.failure(.invalidURL))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(.networkError(error)))
                return
            }
            
            if let response = response as? HTTPURLResponse, !(200...299).contains(response.statusCode) {
                completion(.failure(.httpError(response.statusCode)))
                return
            }
            
            guard let data = data else {
                completion(.failure(.unknownError))
                return
            }
            
            do {
                let products = try JSONDecoder().decode(GetProducto.self, from: data)
                completion(.success(products))
            } catch {
                completion(.failure(.decodingError(error)))
            }
        }.resume()
    }
}
