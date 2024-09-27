//
//  ImagesViewModel.swift
//  battlebuck demo
//
//  Created by Pratik Choudhary on 27/09/24.
//

import Foundation
protocol ViewModelProtocol{
    func success()
    func failed(msg:String)
    
}
final class ImagesViewModel {
    var imagesData: [ImagesModel] = []
    var delegate : ViewModelProtocol?
    func fetchProducts() {
        
        APIManager.shared.request(
            modelType: [ImagesModel].self,
            type: EndPoint.imagesData) { response in
                
                switch response {
                case .success(let data):
                    self.imagesData = data
                    self.delegate?.success()
                    
                case .failure(let error):
                    
                    self.delegate?.failed(msg: error.localizedDescription)
                }
            }
    }
    
    
}

extension ImagesViewModel {
    
    enum Event {
        case loading
        case stopLoading
        case dataLoaded
        case error(Error?)
    }
    
}




