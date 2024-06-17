//
//  SplashView.swift
//  PruebaTecnicaElektra
//
//  Created by Moises Sanchez on 16/06/24.
//

import Foundation
import SwiftUI

struct SplashView: View {
    @State private var isActive = false
    @StateObject private var viewModel: ProductosViewModel
    
    init() {
        let dataSource = ProductoAPIDataSource()
        let service = ProductoService(dataSource: dataSource)
        _viewModel = StateObject(wrappedValue: ProductosViewModel(productoService: service))
    }
    
    var body: some View {
        if isActive {
            ContentView()
                .environmentObject(viewModel)
        } else {
            VStack {
                Image("ImgEkt")
                    .resizable()
                    .frame(width: 100, height: 100)
                Text(Constants.InfoMessages.splash)
                    .font(.headline)
                    .padding(.top, 20)
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    self.isActive = true
                }
            }
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
