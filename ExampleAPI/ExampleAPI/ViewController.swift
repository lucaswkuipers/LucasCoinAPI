//
//  ViewController.swift
//  ExampleAPI
//
//  Created by Lucas Werner Kuipers on 15/04/2021.
//

import UIKit
import API
import Utilities
import AlamofireImage

struct LayoutDimensions {
	static let cellHeight = CGFloat(100)
}

class ViewController: UIViewController {
	
	@IBOutlet weak var coinSearchBar: UISearchBar!
	@IBOutlet weak var tableView: UITableView!
	@IBOutlet weak var totalCoinsLabel: UILabel!
	var coins = [Coin]()
	
	
	@IBAction func updateCoinsList(_ sender: Any) {
		fetchData()
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		fetchData()
		setupUI()
	}
	func fetchData(searchedCoinID: String = "") {
		coins = API.requestCoinList(assetId: searchedCoinID)
		tableView.reloadData()
	}
	func setupUI() {
		totalCoinsLabel.text = "Total of coins: \(coins.count)"
		
		let nib = UINib(nibName: "CoinTableViewCell", bundle: nil)
		
		tableView.register(nib, forCellReuseIdentifier: "CoinTableViewCell")
		tableView.delegate = self
		tableView.dataSource = self
		tableView.tableFooterView = UIView()
	}

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return coins.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "CoinTableViewCell") as! CoinTableViewCell
		
		let coin = coins[indexPath.row]
		
		cell.coinAssetIDLabel.text = coin.assetID
		cell.coinNameLabel.text = coin.name
		
		var coinValueStr = ""
		if let coinValue = coin.priceUsd {
			coinValueStr = Utilities.formatCoin(coinAmount: coinValue)
		} else {
			coinValueStr = "-"
		}
		cell.coinValueLabel.text = coinValueStr
		
		if let idIcon = coin.idIcon {
			if let iconUrl = URL(string: "https://s3.eu-central-1.amazonaws.com/bbxt-static-icons/type-id/png_256/\(idIcon.replacingOccurrences(of: "-", with: "")).png") {
				cell.coinIconImageView.af.setImage(withURL: iconUrl)
			}
		}
		return cell
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return LayoutDimensions.cellHeight
	}
	
	
}
