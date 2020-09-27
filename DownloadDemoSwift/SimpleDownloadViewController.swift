//
//  ViewController.swift
//  DownloaderDemoForSwift
//
//  Created by 李辉 on 2020/9/27.
//

import UIKit
import Alamofire

class SimpleDownloadViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBOutlet weak var progressView: UIProgressView!
    
    @IBOutlet weak var progressText: UILabel!
    @IBAction func downloadAction(_ sender: Any) {
        let destination = DownloadRequest.suggestedDownloadDestination(for: .documentDirectory)
        let url = "https://userfilecentertest.oss-cn-hangzhou.aliyuncs.com/5caeea8324aa9a000e937be7/8e6ee1b4c0db4f19b4dac4a585c6c35d.mp4"
        AF.download(url, to: destination).downloadProgress { (progress) in
            print("Download Progress: \(progress.fractionCompleted)")
            self.progressView.progress = Float(progress.fractionCompleted)
            let s = String(format: "%.f%%", Float(progress.fractionCompleted)*100.0)
            self.progressText.text = "下载进度:" + s
        }.responseData { (response) in
            debugPrint(response)
        }
    }
    @IBAction func downloadPauseAction(_ sender: Any) {
        
    }
}

