//
//  ViewController.swift
//  SimpleListWithRxSwift
//
//  Created by Sanjeev .Gautam on 15/08/17.
//  Copyright © 2017 SWS. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {

    // Tableview
    @IBOutlet weak var listTableView: UITableView!
    
    // dispose bag
    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // countries array
        let countriesList: [String] = ["India", "Bhutan", "USA", "UK", "Canada", "Chile", "Egypt"]
        
        // observable countries object
        let countries = Observable.just(countriesList)
        
        // bind observable object with tableview to render
        countries.bind(to: listTableView.rx.items(cellIdentifier: "countryCell")) {
            row, country, cell in
            cell.textLabel?.text = country
        }.addDisposableTo(disposeBag)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
