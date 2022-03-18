//
//  CollectionViewTableViewCell.swift
//  HiveInnovation
//
//  Created by Aye Su Naing on 17/03/2022.
//

import UIKit

class CollectionViewTableViewCell: UITableViewCell {

    static var identifier : String {
        return String(describing: self)
    }
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var collectionViewHeightConstraint: NSLayoutConstraint!
    var products : [Product] = []
    var itemWidth : CGFloat = 0.0
    
    @IBOutlet weak var delegate : ProductsCollectionTableViewCellDelegate?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        itemWidth = (UIScreen.main.bounds.width - 30) / 2
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: ProductCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: ProductCollectionViewCell.identifier)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setProducts (products : [Product]){
        
        
        self.products = products
        let productlistHeight : CGFloat = (itemWidth * CGFloat((self.products.count / 2))) + 100
//        if products.count % 2 != 0 {
//            productlistHeight =   (itemWidth * CGFloat((self.products.count / 2))) + itemWidth + 20
//        } else {
//            productlistHeight =   (itemWidth * CGFloat((self.products.count / 2))) + 20
//        }
        
        collectionViewHeightConstraint.constant = productlistHeight
        collectionView.reloadData()
        
        
    }
    
    
}

extension CollectionViewTableViewCell : UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }


    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCollectionViewCell.identifier, for: indexPath) as? ProductCollectionViewCell else { return UICollectionViewCell()}
        cell.setProduct(product: products[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        print("didEndDisplayingdidEndDisplaying   \(indexPath.row)")
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
    }

    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.clickedProduct(position: indexPath.row)
    }
    
}
extension CollectionViewTableViewCell : UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        return CGSize(width: Int(itemWidth), height: Int(itemWidth))
    }
    
    
}
