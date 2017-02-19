//
//  BusinessesViewController.swift
//  Yelp
//
//  Created by Timothy Lee on 4/23/15.
//  Copyright (c) 2015 Timothy Lee. All rights reserved.
//

import UIKit

class BusinessesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
	
	@IBOutlet weak var tableView: UITableView!
	
	var searchBar: UISearchBar!
	
	var businesses: [Business]!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.tableView.delegate = self
		self.tableView.dataSource = self
		self.tableView.rowHeight = UITableViewAutomaticDimension
		self.tableView.estimatedRowHeight = 110
		
		// Initialize the UISearchBar
		self.searchBar = UISearchBar()
		self.searchBar.delegate = self
		
		// Add SearchBar to the NavigationBar
		self.searchBar.sizeToFit()
		self.navigationItem.titleView = searchBar
		
		self.search(for: "Thai")
		
		/* Example of Yelp search with more search options specified
		Business.searchWithTerm("Restaurants", sort: .Distance, categories: ["asianfusion", "burgers"], deals: true) { (businesses: [Business]!, error: NSError!) -> Void in
		self.businesses = businesses
		
		for business in businesses {
		print(business.name!)
		print(business.address!)
		}
		}
		*/
		
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		if self.businesses != nil {
			return self.businesses.count
		} else {
			return 0
		}
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		let cell = tableView.dequeueReusableCell(withIdentifier: "BusinessCell", for: indexPath) as! BusinessCell
		
		let business = businesses![indexPath.row]
		
		cell.businessNameLabel.text = business.name
		cell.distanceLabel.text = business.distance
		cell.addressLabel.text = business.address
		if business.reviewCount != nil && business.reviewCount as! Int > 0 {
			cell.reviewCountLabel.text = String(describing: business.reviewCount!) + " Reviews"
		} else {
			cell.reviewCountLabel.text = "No Reviews"
		}
		cell.categoryLabel.text = business.categories
		cell.ratingImage.setImageWith(business.ratingImageURL!)
		cell.businessImage.setImageWith(business.imageURL!)
		
		return cell
		
	}
	
	fileprivate func search(for term: String) {
		Business.searchWithTerm(term: term, completion: { (businesses: [Business]?, error: Error?) -> Void in
			
			self.businesses = businesses
			self.tableView.reloadData()
			
		}
		)
	}
	
	/*
	// MARK: - Navigation
	
	// In a storyboard-based application, you will often want to do a little preparation before navigation
	override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
	// Get the new view controller using segue.destinationViewController.
	// Pass the selected object to the new view controller.
	}
	*/
	
}

extension BusinessesViewController: UISearchBarDelegate {
	
	func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
		searchBar.setShowsCancelButton(true, animated: true)
		return true
	}
	
	func searchBarShouldEndEditing(_ searchBar: UISearchBar) -> Bool {
		searchBar.setShowsCancelButton(false, animated: true)
		return true
	}
	
	func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
		searchBar.text = ""
		searchBar.resignFirstResponder()
	}
	
	func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
		let searchTerm = searchBar.text
		searchBar.resignFirstResponder()
		search(for: searchTerm!)
	}
}
