//
//  Segmentio.swift
//  HealthHub
//
//  Created by OBS on 21/12/2021.
//



import UIKit
import Segmentio

extension Segmentio {
    
    func setupSegmentio( titles: [String]) {
        
        
       var content = [SegmentioItem]()
               
       for title in titles {
           let tornadoItem = SegmentioItem(title: title , image: nil)
           content.append(tornadoItem)
       }
        
        let bottomIndicator = SegmentioIndicatorOptions(
            type: .bottom,
            ratio: 1,
            height: 2,
            color: UIColor(named: Colors.PrimaryAppColor1)!
        )
       // let vLine = SegmentioVerticalSeparatorOptions(ratio: 1, color: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
        let hLine = SegmentioHorizontalSeparatorOptions(type: SegmentioHorizontalSeparatorType.bottom, height: 1, color: UIColor.clear)
        
        let myFont = UIFont.systemFont(ofSize: 17)
        
        let segmentStates = SegmentioStates(
            defaultState: SegmentioState(
                backgroundColor: UIColor.clear,
                titleFont: semiBold(size: 12),
                titleTextColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            ),
            selectedState : SegmentioState(
                  backgroundColor: UIColor.clear,
                  titleFont: semiBold(size: 12),
                    titleTextColor: UIColor(named: Colors.PrimaryAppColor1)!
            ),
            highlightedState: SegmentioState( //Hold tapped
                backgroundColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0),
                titleFont: semiBold(size: 12),
                titleTextColor:  #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            )
        )
        
        
        var options = SegmentioOptions(
            backgroundColor:  #colorLiteral(red: 0.9764705882, green: 0.9803921569, blue: 0.9882352941, alpha: 1),
            segmentPosition: .dynamic,
            scrollEnabled: true,
            indicatorOptions: bottomIndicator,
            horizontalSeparatorOptions: hLine,
            verticalSeparatorOptions: .none,
            imageContentMode: .center,
            labelTextAlignment: .center,
            segmentStates: segmentStates)
        
        self.setup(
            content: content,
            style: SegmentioStyle.onlyLabel,
            options: options
        )
    }
    
    
}
