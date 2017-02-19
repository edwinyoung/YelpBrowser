//
//  BusinessesViewController.swift
//  Yelp
//
//  Created by Timothy Lee on 4/23/15.
//  Copyright (c) 2015 Timothy Lee. All rights reserved.
//

import UIKit

class BusinessesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
	
	var businesses: [Business]!
	
	@IBOutlet weak var tableView: UITableView!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.tableView.delegate = self
		self.tableView.dataSource = self
		self.tableView.rowHeight = UITableViewAutomaticDimension
		self.tableView.estimatedRowHeight = 110
		
		Business.searchWithTerm(term: "Thai", completion: { (businesses: [Business]?, error: Error?) -> Void in
			
			self.businesses = businesses
//			if let businesses = businesses {
//				for business in businesses {
//					print(business.name!)
//					print(business.address!)
//				}
//			}
			self.tableView.reloadData()
			
		}
		)
		
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
	
	/*
	// MARK: - Navigation
	
	// In a storyboard-based application, you will often want to do a little preparation before navigation
	override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
	// Get the new view controller using segue.destinationViewController.
	// Pass the selected object to the new view controller.
	}
	*/
	
}
