//
//  ViewController.swift
//  NSUserDefaults-tutorial
//
//  Created by Arthit Thongpan on 6/23/2558 BE.
//  Copyright © 2558 Arthit Thongpan. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    // MARK: - Properties
    let kData = "kData"
    var arrayList:[Int] = []
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        
        readData() //โหลด data
    }
    
    // MARK: - Action
    @IBAction func writeButtonClicked(sender: UIButton)
    {
        writeData()
    }
    
    
    
    @IBAction func readButtonClicked(sender: UIButton)
    {
        readData()
    }
    
    // MARK: - Data Read, Write
    func readData(){
        let defaults = NSUserDefaults.standardUserDefaults()
        
        if let aData = defaults.arrayForKey(kData) // read data
        {
            arrayList = aData as! [Int] // replace data
            tableView.reloadData()  // reload data
        }
    }
    func writeData(){
        let defaults = NSUserDefaults.standardUserDefaults()
        let limit = 1000
        let randomNumber = Int(arc4random_uniform(UInt32(limit)))
        
        arrayList.append(randomNumber)
        defaults.setObject(arrayList, forKey: kData)  // write data
    }
    
    // MARK: - UITableViewDataSource
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return arrayList.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        
        let cellIdentifier = "cell"
        let cell:UITableViewCell = UITableViewCell(style:UITableViewCellStyle.Subtitle, reuseIdentifier:cellIdentifier)
        
        let num = arrayList[indexPath.row]
        cell.textLabel!.text = "row \(indexPath.row), data =\(num)"
        return cell
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    


}

