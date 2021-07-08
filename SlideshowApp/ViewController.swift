//
//  ViewController.swift
//  SlideshowApp
//
//  Created by akiyoshi220 on 2021/07/08.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var prevButton: UIButton!
    
    // 画像のファイル番号
    var num: Int = 1
    // タイマーオブジェクト
    var timer: Timer!
    
    // 画像の最小ファイル名
    let min: Int = 1
    // 画像の最大ファイル名
    let max: Int = 3
    // 再生ボタンのボタンラベル
    let play: String = "再生"
    // 停止ボタンのボタンラベル
    let stop: String = "停止"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        changeImage()
        playButton.setTitle(play, for: .normal)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detailViewController: DetailViewController = segue.destination as! DetailViewController
        detailViewController.fileName = createFileName()
    }
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
        print("back")
    }
    @IBAction func onTapImageView(_ sender: Any) {
        stopSlideShow()
    }
    // スライドショー
    @IBAction func autoplay(_ sender: Any) {
        if timer == nil {runSlideShow()
        } else {stopSlideShow()
        }
        
    }
    
    func runSlideShow() {
        if timer == nil {
            timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(next(_:)), userInfo: nil, repeats: true)
        }
        playButton.setTitle(stop, for: .normal)
        nextButton.isEnabled = false
        prevButton.isEnabled = false
    }
    func stopSlideShow() {
        if timer != nil {
            timer.invalidate()
            timer = nil
        }
        playButton.setTitle(play, for: .normal)
        nextButton.isEnabled = true
        prevButton.isEnabled = true
    }
    
    // 次の画像を表示
    @IBAction func next(_ sender: Any) {
        num += 1
        if(num > max) {
            num = 1
        }
        changeImage()
    }
    
    // 前の画像を表示
    @IBAction func prev(_ sender: Any) {
        num -= 1
        if(num < min) {
            num = max
        }
        changeImage()
    }
    
    // 画像を表示
    func changeImage() {
        imageView.image = UIImage(named: createFileName())
    }
    
    // 画像ファイル名を生成
    func createFileName() -> String {
        return "images/" + String(num) + ".jpeg"
    }
    
}

