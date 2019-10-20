//
//  ViewController.swift
//  PDFTextView
//
//  Created by Neil Jain on 10/20/19.
//  Copyright © 2019 NeilsUltimateLab. All rights reserved.
//

import Cocoa
import PDFKit

class ViewController: NSViewController {

    @IBOutlet weak var pdfView: PDFView!
    @IBOutlet weak var textView: NSTextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.pdfView.acceptsDraggedFiles = true
        observeNotifications()
    }
    
    private func observeNotifications() {
        NotificationCenter.default.addObserver(forName: NSNotification.Name.PDFViewPageChanged, object: nil, queue: nil) { (notification) in
            guard let pdfView = notification.object as? PDFView else { return }
            if let attributedString = pdfView.currentPage?.attributedString {
                self.textView.textStorage?.setAttributedString(attributedString)
            }
        }
    }

}
