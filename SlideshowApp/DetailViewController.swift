//
//  DetailViewController.swift
//  SlideshowApp
//
//  Created by akiyoshi220 on 2021/07/08.
//

import UIKit

class DetailViewController: UIViewController {
    
    // 表示する画像ファイル名
    var fileName: String = ""
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = UIImage(named: fileName)
    }

}
