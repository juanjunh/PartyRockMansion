//
//  PartyCell.swift
//  PartyrockMansion
//
//  Created by JanielHNY on 2017/9/18.
//  Copyright © 2017年 JanielHNY. All rights reserved.
//

import UIKit

class PartyCell: UITableViewCell {

    @IBOutlet weak var VideoPreviewImage: UIImageView!
   
    @IBOutlet weak var videoTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    func updateUI (partyRock: PartyRock){
        videoTitle.text = partyRock.videoTitle
        
        
        let url = URL(String: partyRock.imageURL)!
        
        DispatchQueue.global().async{
            do {
                let data = try Data(contentsOF: url)
                DispatchQueue.global().sync{
                    self.VideoPreviewImage.image = UIImage(data: data)
                }
                
            } catch{
                
            }
        }
            
        
        
    }

}
