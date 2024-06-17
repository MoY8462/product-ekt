//
//  Constants.swift
//  PruebaTecnicaElektra
//
//  Created by Moises Sanchez on 16/06/24.
//

import Foundation

struct Constants {
    struct API {
        static let baseURL = "http://alb-dev-ekt-875108740.us-east-1.elb.amazonaws.com/sapp/productos/plp/1/ad2fdd4bbaec4d15aa610a884f02c91a"
    }
    
    struct InfoMessages {
        static let splash = "Cargando productos..."
    }
    
    // Puedes agregar más constantes aquí
    struct ErrorMessages {
        static let unknownError = "Ha ocurrido un error desconocido."
        static let networkError = "Error de red."
        static let decodingError = "Error de decodificación."
        static let invalidURL = "URL inválida."
    }
}
