//
//  CategoryViewController.swift
//  RingtonesProject
//
//  Created by Hong Chinh on 6/10/19.
//  Copyright © 2019 Hong Chinh. All rights reserved.
//

import UIKit

class CategoryVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate{
    

    var arrayImage = [UIImage(named: "1"), UIImage(named: "2"),UIImage(named: "3"),UIImage(named: "4"),UIImage(named: "5"),UIImage(named: "6"),UIImage(named: "7"),UIImage(named: "8"),UIImage(named: "9"),UIImage(named: "10"),UIImage(named: "11"),UIImage(named: "12"),UIImage(named: "13"),UIImage(named: "14"),UIImage(named: "15"),UIImage(named: "16"),UIImage(named: "17"),UIImage(named: "18"),UIImage(named: "19"),UIImage(named: "20"),UIImage(named: "21"),UIImage(named: "22"),UIImage(named: "23"),UIImage(named: "24"),UIImage(named: "25"),UIImage(named: "26"),UIImage(named: "27"),UIImage(named: "28"),UIImage(named: "29"),UIImage(named: "30"),UIImage(named: "31"),UIImage(named: "32"),UIImage(named: "33"),UIImage(named: "34"),UIImage(named: "35"),UIImage(named: "36"),UIImage(named: "37"),UIImage(named: "38"),UIImage(named: "39"),UIImage(named: "40"),UIImage(named: "41"),UIImage(named: "42")]
    
    @IBOutlet weak var collectionView: UICollectionView!
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        getDataService()

        }
    func getDataService() {
        DataService.share.getDataApi{(data) in
            self.collectionView.reloadData()
        }
    }
    
    //MARK: UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return DataService.shared.service.count
        return DataService.share.ringtone.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CategoryCollectionViewCell
       let cellData = DataService.share.ringtone[indexPath.row]
        
        cell.tittleLabel.text = cellData.title
        cell.imageCategory.image = arrayImage[indexPath.row]
        return cell
    }
    
//    @IBAction func close(_ sender: Any) {
//        
//    }
    

    

}
