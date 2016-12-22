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
    
    var docDirectoryURL:NSURL
    override init(){
        super.init()
        let URLs = FileManager.default.urls(for: NSDocumentDirectory, in: NSUserDomainMask)
        self.docDirectoryURL = URLs[0]
    }
    
    func download(_ urlString:String){
        if let url = URL(string: urlString){
            let downloadTask:URLSessionDownloadTask = downloadSession.downloadTask(with: url)
            downloadTask.resume()
        }

    }
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64){
        let a = Float(totalBytesWritten)/Float(totalBytesExpectedToWrite)
        print("Progress: \(a)")
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
        let destinationFilename:NSString = downloadTask.originalRequest.url?.lastPathComponent
        let destinationURL:NSURL = self.docDirectoryURL.URLByAppendingPathComponent(destinationFilename)
        
        if (fileManager.fileExists(atPath: destinationURL.path)){
            fileManager.removeItem(at: destinationURL)
        }
        
        let success = fileManager.copyItem(at: location, to: destinationURL)
        
        if (success) {

        }
    }
    
}
