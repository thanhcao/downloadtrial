//
//  DownloadSingleton.swift
//  aaa
//
//  Created by lavalamp on 12/21/16.
//  Copyright © 2016 biglabs. All rights reserved.
//

import Foundation
class DownloadSingleton:NSObject, URLSessionDelegate{
    static let sharedInstance: DownloadSingleton = DownloadSingleton()
    lazy var downloadSession:URLSession = {
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration, delegate: self, delegateQueue: nil)
        return session
    }()
    
    override init(){
        super.init()
    }
    
    func download(_ urlString:String){
        if let url = URL(string: urlString){
            let downloadTask:URLSessionDownloadTask = downloadSession.downloadTask(with: url)
            downloadTask.resume()
        }

    }
    
    public func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64){
        let a = Float(totalBytesWritten)/Float(totalBytesExpectedToWrite)
        print("Progress: \(a)")
    }
    
}
