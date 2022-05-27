//
//  MedicalAttachmentController.swift
//  HealthHub
//
//  Created by Hamza on 10/03/2022.
//

import UIKit

class MedicalAttachmentController: BaseController {
    
    lazy var docimg : UIImageView = {
        let iv = UIImageView()
        iv.layer.cornerRadius = 12
        iv.backgroundColor = .clear
        iv.image = UIImage(named: "NA1")
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        return iv
    }()
    
    var url = URL(string: "")
     
    override func viewDidLoad() {
        super.viewDidLoad()
        self.headerLbl.text = "Patient Medical Attachment"
        // Do any additional setup after loading the view.
        self.docimg.image = drawPDFfromURL(url: url!)
        setup()
    }
    
    func setup(){
        let margin = view.layoutMarginsGuide
        childView.addSubview(docimg)
        
        NSLayoutConstraint.activate([
            docimg.topAnchor.constraint(equalTo: headerView.topAnchor, constant: -18 * appConstant.heightRatio),
            docimg.leadingAnchor.constraint(equalTo: childView.leadingAnchor, constant: 12 * appConstant.widthRatio),
            docimg.trailingAnchor.constraint(equalTo: childView.trailingAnchor, constant: -12 * appConstant.widthRatio),
            docimg.bottomAnchor.constraint(equalTo: margin.bottomAnchor),
        ])
    }


    func drawPDFfromURL(url: URL) -> UIImage? {
        guard let document = CGPDFDocument(url as CFURL) else { return nil }
        guard let page = document.page(at: 1) else { return nil }

        let pageRect = page.getBoxRect(.mediaBox)
        let renderer = UIGraphicsImageRenderer(size: pageRect.size)
        let img = renderer.image { ctx in
            UIColor.white.set()
            ctx.fill(pageRect)

            ctx.cgContext.translateBy(x: 0.0, y: pageRect.size.height)
            ctx.cgContext.scaleBy(x: 1.0, y: -1.0)

            ctx.cgContext.drawPDFPage(page)
        }

        return img
    }

}
