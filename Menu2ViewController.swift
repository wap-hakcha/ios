//
//  Menu2ViewController.swift
//  WAP2
//
//  Created by 임성현 on 28/06/2019.
//  Copyright © 2019 임성현. All rights reserved.
//

import UIKit

class Menu2ViewController: UITableViewController {
    
    var dataset = [
        ("수육보쌈", "4700", "수육 + 공기밥 + 무말랭이 + 겉절이 + 계란국", "4.5"),
        ("양푼이비빔밥", "3700", "비빔밥 + 뚝배기 된장국", "3.6"),
        ("소고기전골", "4400", "소고기가 들어간 라면사리 전골 + 공기밥 + 반찬", "4.0"),
        ("닭갈비백반", "4700", "매콤한 닭갈비와 백반", "3.9"),
        ("알밥", "3800", "뚝배기 날치알밥", "4.3")
    ]
    
    var datalist = [MenuVO]()
    
    lazy var list: [MenuVO] = {
        for (name, price, detail, rating) in self.dataset {
            let mVo = MenuVO()
            mVo.name = name
            mVo.price = price
            mVo.detail = detail
            mVo.rating = rating
            
            datalist.append(mVo)
        }
        return datalist
    }()
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = self.list[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell")!
        
        let name = cell.viewWithTag(101) as? UILabel
        let detail = cell.viewWithTag(102) as? UILabel
        let price = cell.viewWithTag(103) as? UILabel
        let rating = cell.viewWithTag(104) as? UILabel
        
        name?.text = row.name
        detail?.text = row.detail
        price?.text = "₩\(row.price!)"
        rating?.text = "⭐️\(row.rating!)"
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        NSLog("선택된 행은 \(indexPath.row)번 째 행입니다. ")
    }
    
    @IBAction func add(_ sender: Any) {
        let alert = UIAlertController(title: "메뉴추가", message: "추가할 메뉴를 작성해주세요", preferredStyle: .alert)
        
        alert.addTextField() { (tf) in
            tf.placeholder = "메뉴 이름"
        }
        alert.addTextField() { (tf) in
            tf.placeholder = "메뉴 정보"
        }
        alert.addTextField() { (tf) in
            tf.placeholder = "가격"
        }
        alert.addTextField() { (tf) in
            tf.placeholder = "평점"
        }
        
        let ok = UIAlertAction(title: "OK", style: .default) {
            (_) in
            let mVo = MenuVO()
            
            if let name = alert.textFields?[0].text {
                mVo.name = name
            }
            if let detail = alert.textFields?[1].text {
                mVo.detail = detail
            }
            if let price = alert.textFields?[2].text {
                mVo.price = price
            }
            if let rating = alert.textFields?[3].text {
                mVo.rating = rating
            }
            self.datalist.append(mVo)
            self.tableView.reloadData()
        }
        
        let cancle = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        
        alert.addAction(ok)
        alert.addAction(cancle)
        
        self.present(alert, animated: false)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
}
