//
//  DownloadSingleton.swift
//  aaa
//
//  Created by lavalamp on 12/21/16.
//  Copyright © 2016 biglabs. All rights reserved.
//

import Foundation
class DownloadSingleton:NSObject, URLSessionDownloadDelegate{

    static let sharedInstance: DownloadSingleton = DownloadSingleton()
    lazy var downloadSession:URLSession = {
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration, delegate: self, delegateQueue: nil)
        return session
    }()
    
    var docDirectoryURL:URL
    override init(){
        let URLs = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        self.docDirectoryURL = URLs[0]
        super.init()
    }
    
    func download(_ urlString:String){
        if let url = URL(string: urlString){
            let downloadTask = downloadSession.downloadTask(with: url)
            downloadTask.resume()
        }

    }
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64){
        let a = Float(totalBytesWritten)/Float(totalBytesExpectedToWrite)
        print("Progress \(downloadTask.taskIdentifier): \(a)")
    }
    
    func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?) {
        if(error != nil) {
            print("Download completed with error: \(error?.localizedDescription)")
        } else {
            print("Download finished successfully")
        }
        
    }
    
    public func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        print("Finish")
        let fileManager:FileManager = FileManager.default
        let destinationFilename:String = (downloadTask.originalRequest?.url?.lastPathComponent)!
        let destinationURL:URL = self.docDirectoryURL.appendingPathComponent(destinationFilename)
        
        if (fileManager.fileExists(atPath: destinationURL.path)){
            do {
                try fileManager.removeItem(at: destinationURL)
            }
            catch let error as NSError {
                print("Ooops! Something went wrong: \(error)")
            }
        }
        
        do {
            try fileManager.copyItem(at: location, to: destinationURL)
        }
        catch let error as NSError {
            print("Ooops! Something went wrong: \(error)")
        }

    }
}
