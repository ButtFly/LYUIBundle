//
//  LYForm.swift
//  LightYouS
//
//  Created by 阿卡丽 on 2020/4/1.
//  Copyright © 2020 阿卡丽. All rights reserved.
//

import UIKit

open class LYForm: UIView {
    
    let table = UITableView()
    fileprivate var sections = [LYSection]()
    
    open override var backgroundColor: UIColor? {
        didSet {
            table.backgroundColor = backgroundColor
        }
    }
    
    public func addRow(_ sender: LYRow, toSectionAtIndex idx: Int = 0) -> Void {
        if sections.count < idx {
            assert(false, "添加到的section不存在，也不能自动创建，请确认section的index: \(idx)和count: \(sections.count)")
        } else if sections.count == idx {
            sections.append(LYSection())
        }
        sections[idx].addRow(sender)
        table.register(sender.cellClass, forCellReuseIdentifier: sender.identifier)
    }
    
    public func insertRow(_ sender: LYRow, toRowIndex idx: Int, inSectionAtIndex atIdx: Int = 0) -> Void {
        if sections.count < atIdx {
            assert(false, "添加到的section不存在，也不能自动创建，请确认section的index: \(idx)和count: \(sections.count)")
        } else if sections.count == atIdx {
            sections.append(LYSection())
        }
        if sections[atIdx].rows.count < idx {
            assert(false, "无法添加到\(idx)")
        }
        sections[atIdx].rows.insert(sender, at: idx)
        table.register(sender.cellClass, forCellReuseIdentifier: sender.identifier)
    }
    
    public func emptyForm() -> Void {
        sections.removeAll()
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(table)
        table.delegate = self
        table.dataSource = self
        table.separatorStyle = .none
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        table.frame = bounds
    }
    
}


extension LYForm: UITableViewDelegate, UITableViewDataSource {
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].rows.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let row = sections[indexPath.section].rows[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: row.identifier, for: indexPath)
        row.fitOutCell(sender: cell)
        return cell
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let row = sections[indexPath.section].rows[indexPath.row]
        row.selectedTarget.doHandle(row)
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return sections[indexPath.section].rows[indexPath.row].height
    }
    
}





/// 更新
extension LYForm {
    
    // Reloading and Updating
    
    // Allows multiple insert/delete/reload/move calls to be animated simultaneously. Nestable.
    @available(iOS 11.0, *)
    func performBatchUpdates(_ updates: (() -> Void)?, completion: ((Bool) -> Void)? = nil) {
        table.performBatchUpdates(updates, completion: completion)
    }

    
    // Use -performBatchUpdates:completion: instead of these methods, which will be deprecated in a future release.
    func beginUpdates() {
        table.beginUpdates()
    }

    func endUpdates() {
        table.endUpdates()
    }

    
    func insertSections(_ sections: IndexSet, with animation: UITableView.RowAnimation) {
        table.insertSections(sections, with: animation)
    }

    func deleteSections(_ sections: IndexSet, with animation: UITableView.RowAnimation) {
        table.deleteSections(sections
            , with: animation)
    }

    @available(iOS 3.0, *)
    func reloadSections(_ sections: IndexSet, with animation: UITableView.RowAnimation) {
        table.reloadSections(sections, with: animation)
    }

    @available(iOS 5.0, *)
    func moveSection(_ section: Int, toSection newSection: Int) {
        table.moveSection(section, toSection: newSection)
    }

    
    func insertRows(at indexPaths: [IndexPath], with animation: UITableView.RowAnimation) {
        table.insertRows(at: indexPaths, with: animation)
    }

    func deleteRows(at indexPaths: [IndexPath], with animation: UITableView.RowAnimation) {
        table.deleteRows(at: indexPaths, with: animation)
    }

    @available(iOS 3.0, *)
    func reloadRows(at indexPaths: [IndexPath], with animation: UITableView.RowAnimation) {
        table.reloadRows(at: indexPaths, with: animation)
    }

    @available(iOS 5.0, *)
    func moveRow(at indexPath: IndexPath, to newIndexPath: IndexPath) {
        table.moveRow(at: indexPath, to: newIndexPath)
    }

    
    // Returns YES if the table view is in the middle of reordering, is displaying a drop target gap, or has drop placeholders. If possible, avoid calling -reloadData while there are uncommitted updates to avoid interfering with user-initiated interactions that have not yet completed.
    @available(iOS 11.0, *)
    var hasUncommittedUpdates: Bool {
        table.hasUncommittedUpdates
    }

    
    // Reloads everything from scratch. Redisplays visible rows. Note that this will cause any existing drop placeholder rows to be removed.
    func reloadData() {
        table.reloadData()
    }

    
}






open class LYSection: Equatable {
    
    public static func == (lhs: LYSection, rhs: LYSection) -> Bool {
        return lhs === rhs
    }
    
    fileprivate var rows = [LYRow]()
    
    open func addRow(_ row: LYRow) -> Void {
        rows.append(row)
    }
    
}


public protocol LYRow: NSObjectProtocol {
    var cellClass: AnyClass { get }
    var identifier: String { get }
    var height: CGFloat { get }
    var selectedTarget: LYAction<LYRow> { get }
    func fitOutCell(sender: UITableViewCell) -> Void
}

extension LYRow {
    var identifier: String {
        return cellClass.description()
    }
    
    var height: CGFloat {
        return 44
    }
    
}
