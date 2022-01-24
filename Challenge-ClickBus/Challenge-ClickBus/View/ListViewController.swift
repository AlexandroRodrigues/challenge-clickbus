//
//  ListViewController.swift
//  Challenge-ClickBus
//
//  Created by Madeinweb on 23/01/22.
//

import UIKit

class ListViewController: UIViewController {

    @IBOutlet weak var listCollection: UICollectionView!
    let controller = ListController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollection()
        getListMovie()
    }
    
    func setupCollection() {
        listCollection.delegate = self
        listCollection.dataSource = self
        self.listCollection.register(UINib(nibName: "ListCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ListCollectionViewCell")
    }
    
    func getListMovie () {
        controller.getList { (sucess) in
            if sucess {
                self.listCollection.reloadData()
            }
        }
    }
    
    func goToDetail(indexPath: IndexPath) {
        if let detailViewController = self.storyboard?.instantiateViewController(identifier: "DetailViewController") as? DetailViewController {
            detailViewController.discoverMovie = self.controller.getItemByIndex(indexPath: indexPath)
            self.navigationController?.pushViewController(detailViewController, animated: true)
        }
    }
}

extension ListViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return controller.numberOfRowsInSection()
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
        let cell = listCollection.dequeueReusableCell(withReuseIdentifier: "ListCollectionViewCell", for: indexPath) as? ListCollectionViewCell
        
        cell?.handledFavoriteButton = {
            print("clicou no favorito")
        }
        
        cell?.setup(list: controller.getItemByIndex(indexPath: indexPath))

        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        goToDetail(indexPath: indexPath)
    }
    
}
