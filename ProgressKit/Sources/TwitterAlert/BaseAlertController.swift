//
//  BaseAlertController.swift
//  ProgressKit
//
//  Created by Mensah Shadrach on 22/01/2019.
//  Copyright © 2019 Mensah Shadrach. All rights reserved.
//

import UIKit

public typealias TWAlertmethods = ()->()
public typealias TWAlertOption = (String,TWAlertmethods)
public typealias TWAlertOptions = [TWAlertOption]

public class BaseAlertController:UIView{
    
    private var alertTable:UITableView
    private var height:CGFloat = 0
    private var options:TWAlertOptions
    override init(frame: CGRect) {
        alertTable = UITableView(frame: frame, style: .plain)
        alertTable.separatorStyle = .none
        alertTable.allowsMultipleSelection = false
        
        self.options = []
        alertTable.register(TWAlertCell.self, forCellReuseIdentifier: String(describing: TWAlertCell.self))
        super.init(frame: frame)
        
    }
    
    init(frame: CGRect, options:TWAlertOptions) {
        alertTable = UITableView(frame: frame, style: .plain)
        alertTable.separatorStyle = .none
        self.options = options
        alertTable.register(TWAlertCell.self, forCellReuseIdentifier: TWAlertCell.identifier)
        super.init(frame: frame)
        
    }
    
    public init(options:TWAlertOptions,icons:[UIImage]? = nil){
        self.options = options
        
        let ops = options.count
        let tableHeight = (ops * 50) + 10
        let total = tableHeight + 50
        height = CGFloat(total)
        let frame = CGRect(x: 0, y: UIScreen.main.bounds.height, width: UIScreen.main.bounds.width, height: CGFloat(total))
        let tabframe = CGRect(origin: .zero, size: CGSize(width: frame.width, height:CGFloat(tableHeight)))
        alertTable = UITableView(frame: tabframe, style: .plain)
        alertTable.separatorStyle = .none
        self.options = options
        alertTable.register(TWAlertCell.self, forCellReuseIdentifier: TWAlertCell.identifier)
        super.init(frame: frame)
        self.frame = frame
        
        self.makeCancel()
        self.backgroundColor = UIColor.black
        alertTable.delegate = self
        alertTable.dataSource = self
    }
    
    func makeCancel(){
       let cancel = UIButton(frame: CGRect(x: 10, y: height - 50, width: frame.width - 20, height: 50))
        cancel.backgroundColor = UIColor(red:0.95, green:0.95, blue:0.95, alpha:1.0)
        cancel.setTitle("Cancel", for: .normal)
        cancel.clipsToBounds = true
        cancel.setTitleColor(.darkText, for: .normal)
        cancel.layer.cornerRadius = 25
        addSubview(cancel)
        cancel.addTarget(self, action: #selector(dismiss), for: .touchUpInside)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        alertTable.backgroundColor = .green
        self.addSubview(alertTable)
    }
    
    
    public func showSelf(){
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.2, options: .curveEaseInOut, animations: {
            self.frame.origin.y -= self.height
        }) { (sucess) in
            //
        }
    }
    
    public override func didMoveToWindow() {
        super.didMoveToWindow()
        
    }
    

    
    @objc func dismiss(){
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.2, options: .curveEaseInOut, animations: {
            self.frame.origin.y += self.height
        }) { (sucess) in
            
        }
    }
}


extension BaseAlertController:UITableViewDelegate,UITableViewDataSource{
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return options.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let option = options[indexPath.row]
        if let cell = tableView.dequeueReusableCell(withIdentifier: TWAlertCell.identifier, for: indexPath) as? TWAlertCell{
            cell.configure(title: option.0)
            return cell
        }
        return TWAlertCell()
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let option = options[indexPath.row]
        let method = option.1
        method()
        self.dismiss()
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}



class TWAlertCell:UITableViewCell{
    
    private var lable:UILabel = {
        let lable = UILabel()
        lable.backgroundColor = .red
        lable.textAlignment = .left
        lable.text = "Please work aa"
        lable.textColor = .black
        lable.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        lable.numberOfLines = 1
        return lable
    }()
    
    
    
    private var icon:UIImageView = {
        let v = UIImageView()
        v.clipsToBounds = true
        v.contentMode = .scaleAspectFill
        return v
    }()
    

    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: String(describing: TWAlertCell.self))
        commonInit()
    }
    
//    init(frame:CGRect){
//        super.init(style: , reuseIdentifier: String(describing: TWAlertCell.self))
//        backgroundColor = UIColor.groupTableViewBackground
//        commonInit()
//    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        addSubview(icon)
        addSubview(lable)
        icon = UIImageView(frame: CGRect(x: 8, y: 15/2, width: 35, height: 35))
        lable = UILabel(frame: CGRect(x: 60, y: 10, width: 100, height: 30))
        
    }
    
    func configure(title:String,icon:String? = nil){
        lable.text = title
        if let ic = icon {self.icon.image = UIImage(named: ic)}
        self.icon.image = UIImage(named: "ic")
    }
    
    
    func commonInit(){
        self.backgroundColor = UIColor.groupTableViewBackground
        contentView.addSubview(icon)
        contentView.addSubview(lable)
        selectionStyle = .none
    }
}
