//
//  GImagePicker.swift
//  GImagePicker
//
//  Created by nishiyama on 2016/06/10.
//  Copyright © 2016年 ogis-ri. All rights reserved.
//

import Foundation

public class GImagePicker: NSObject, QBImagePickerControllerDelegate
{
    var q:QBImagePickerController!
    
    var onComplated: ((AnyObject)->())?
    var onCanceled: (()->())?
    
    var maximumNumberOfSelection:Int = 10
    /*
    override init()
    {
        self.onComplated = nil
        self.onCanceled = nil
        return
    }
    */
    
    
    public func pickImage(parentViewController: UIViewController,
                          complated:(AnyObject)->(), canceled:()->())
    {
        q = QBImagePickerController()
        q.delegate = self
        q.allowsMultipleSelection = true
        q.maximumNumberOfSelection = UInt(self.maximumNumberOfSelection)
        q.showsNumberOfSelectedAssets = true
        
        // デリゲート設定
        self.onComplated = complated
        self.onCanceled = canceled
        
        
        parentViewController.presentViewController(q, animated: true, completion: nil)
    }
    
    
    // キャンセルボタンを押した //
    @objc public func qb_imagePickerControllerDidCancel(imagePickerController: QBImagePickerController)
    {
        q.dismissViewControllerAnimated(true, completion: nil)
        
        if( self.onCanceled != nil ) {
            self.onCanceled!()
        }
    }
    
    // OKボタンを押した
    @objc public func qb_imagePickerController(imagePickerController: QBImagePickerController,
                                               didFinishPickingAssets assets: [AnyObject])
    {
        q.dismissViewControllerAnimated(true, completion: nil)
        
        if( self.onComplated != nil ) {
            self.onComplated!(assets)
        }
    }
    
}