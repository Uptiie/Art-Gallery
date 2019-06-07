//
//  PaintingListViewController.swift
//  ArtGallery
//
//  Created by Uptiie on 6/6/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class PaintingListViewController: UIViewController {

    // MARK: - Outlets and Properties
    @IBOutlet weak var tableView: UITableView!
    
    let paintingController = PaintingController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.dataSource = self
    }
    
    // MARK: - Methods
    
}

extension PaintingListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.paintingController.paintings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PaintingCell", for: indexPath) as? PaintingTableViewCell else { return UITableViewCell() }
        
        let painting = self.paintingController.paintings[indexPath.row]
        
        cell.painting = painting
        cell.delegate = self
        
        return cell
        
    }
    
}

extension PaintingListViewController:
PaintingTableViewCellDelegate {
    func likedButtonWasTapped(on cell: PaintingTableViewCell) {
        guard let indexPath = self.tableView.indexPath(for: cell) else { return }
        
        let painting = self.paintingController.paintings[indexPath.row]
        
        self.paintingController.toggleIsLiked(for: painting)
        self.tableView.reloadRows(at: [indexPath], with: .automatic)
     }
}
