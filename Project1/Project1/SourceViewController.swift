//
//  SourceViewController.swift
//  Project1
//
//  Created by Rocky on 2018/1/3.
//  Copyright © 2018年 Rocky. All rights reserved.
//

import Cocoa

class SourceViewController: NSViewController {
    
    private var pictures:[String] = []

    @IBOutlet weak var tableView: NSTableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
     
        appendData()
    }
    
    private func appendData(){
        
        guard let path = Bundle.main.resourcePath else { return }
        
        let items = try! FileManager.default.contentsOfDirectory(atPath: path)
        
        items.forEach{ [weak self] in
            if $0.hasPrefix("nssl") {
                self?.pictures.append($0)
            }
        }
    }
    
}

extension SourceViewController:NSTableViewDataSource,NSTableViewDelegate{
    
    func numberOfRows(in tableView: NSTableView) -> Int {
        return pictures.count
    }
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        
        guard let cell = tableView.makeView(withIdentifier: (tableColumn?.identifier)!, owner: self) as? NSTableCellView else { return nil }
        cell.textField?.stringValue = pictures[row]
        return cell
    }
    
    func tableViewSelectionDidChange(_ notification: Notification) {
        print("点击")
        
        guard let splitVc = parent ,
            let detailVc = splitVc.childViewControllers[1] as? DetailViewController else { return  }
        
        detailVc.imageSelected(name: pictures[tableView.selectedRow])
    }
    
   
}
