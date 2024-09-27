//
//  ImagesVC.swift
//  battlebuck demo
//
//  Created by Pratik Choudhary on 27/09/24.
//

import UIKit

class ImagesVC: UIViewController {
    @IBOutlet weak var ImagesCollection : UICollectionView!
    private var viewModel = ImagesViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        configuration()
        setupCollectionView()
        // Do any additional setup after loading the view.
    }
    func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = .zero
        layout.minimumLineSpacing = 0 //as per your requirement
        layout.minimumInteritemSpacing = 0 //as per your requirement
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: self.ImagesCollection.frame.width / 2, height: 190)
        self.ImagesCollection.collectionViewLayout = layout
    }


}

extension ImagesVC {
    
    func configuration() {
        ImagesCollection.register(UINib(nibName: "ImagesVCCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ImagesVCCollectionViewCell")
        ImagesCollection.delegate = self
        ImagesCollection.dataSource = self
        initViewModal()
     //   observeEvents()
    }
    
    func initViewModal() {
        viewModel.fetchProducts()
    }
    

}

extension ImagesVC : ViewModelProtocol {
    func success() {
//
        DispatchQueue.main.async{
            self.ImagesCollection.reloadData()
        }
    }
    
    func failed(msg: String) {
        print(msg)

        DispatchQueue.main.async{
            self.ImagesCollection.reloadData()
        }
    }
    
    
}


extension ImagesVC : UICollectionViewDataSource , UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.imagesData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = ImagesCollection.dequeueReusableCell(withReuseIdentifier : "ImagesVCCollectionViewCell", for: indexPath) as? ImagesVCCollectionViewCell else {return UICollectionViewCell()}
        let imagesDatas = viewModel.imagesData[indexPath.row]
        cell.imagesData = imagesDatas
        return  cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       let imagesDatas = viewModel.imagesData[indexPath.row]
        let storyboard = UIStoryboard(name: "Main", bundle: nil);
        let vc = storyboard.instantiateViewController(withIdentifier: "ImageDetailVC") as! ImageDetailVC
        vc.imagesData = imagesDatas
        self.navigationController?.pushViewController(vc, animated: true)
    }
   
}


extension ImagesVC: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (view.frame.width - 20) / 2.0
        return CGSize(width: width, height: width)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }

}
