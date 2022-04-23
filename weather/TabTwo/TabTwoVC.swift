//
//  TabTwoVC.swift
//  weather
//
//  Created by disco on 19.04.2022.
//

import UIKit

class TabTwoVC: UIViewController {
	
	@IBOutlet weak var collectionView: UICollectionView!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		createCollectionView()
		collectionView.delegate = self
		collectionView.collectionViewLayout = UICollectionViewFlowLayout()
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
		collectionView.reloadData()
	}
	
	private func createCollectionView() {
		collectionView.delegate = self
		collectionView.dataSource = self
		collectionView.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "cellID")
		collectionView.collectionViewLayout = UICollectionViewFlowLayout()
	}
}

extension TabTwoVC: UICollectionViewDataSource {
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellID", for: indexPath) as? CollectionViewCell else { return UICollectionViewCell() }
		cell.setupCell(with: descriptionsList[indexPath.row])
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return descriptionsList.count
	}
}

extension TabTwoVC: UICollectionViewDelegateFlowLayout {
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return CGSize(width: 150, height: 160)
	}
}
