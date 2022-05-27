//
//  MainHealthHistoryController.swift
//  HealthHub
//
//  Created by OBS on 05/01/2022.
//

import UIKit

class MainHealthHistoryController: BaseController {

    lazy var scrollViewContainer : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: Colors.AppBGColor)
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var scrollView = UIScrollView()

    lazy var pageController : UIPageControl = {
        let page = UIPageControl()
        page.backgroundColor = .clear
        page.translatesAutoresizingMaskIntoConstraints = false
        page.tintColor = .red
        page.pageIndicatorTintColor = .lightGray
        page.currentPageIndicatorTintColor = UIColor(named: Colors.TextColor)
        return page
    }()
    
    
    var isfromProfile = false
    
    var slideX = 0
    var slides:[UIView] = []
    var currentPage = 0
    var firstPage = false
    var secondPage = false
    var thirdPage = false
    var fourthPage = false
    var fivePage = false
    var sixPage = false
    var sevenPage = false
    var eightPage = false
    var ninePage = false
    var tenPage = false
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        headerLbl.text = "Health profile"
        backBtn.isHidden = true
        view.backgroundColor = UIColor(named: Colors.AppBGColor)
        self.pageController.isHidden = true
        slides = createSlides()
        setupSlideScrollView(slides: slides)
        setup()
        
        
        history1Data = self
        history2Data = self
        history3Data = self
        history4Data = self
        history5Data = self
        history6Data = self
        history7Data = self
        history8Data = self
        history9Data = self
        history10Data = self
        
    }
    
    func setup(){
        let margin = view.layoutMarginsGuide
        childView.addSubview(scrollViewContainer)
        scrollViewContainer.addSubview(scrollView)
        view.addSubview(pageController)
        
        
        NSLayoutConstraint.activate([
        
            scrollViewContainer.topAnchor.constraint(equalTo: childView.topAnchor,constant: 20 * appConstant.heightRatio),
            scrollViewContainer.leadingAnchor.constraint(equalTo: childView.leadingAnchor,constant: 0 * appConstant.widthRatio),
            scrollViewContainer.trailingAnchor.constraint(equalTo: childView.trailingAnchor,constant: 0 * appConstant.widthRatio),
            scrollViewContainer.bottomAnchor.constraint(equalTo: childView.bottomAnchor,constant: 0 * appConstant.heightRatio),
            
            pageController.bottomAnchor.constraint(equalTo: margin.bottomAnchor, constant:  -12 * appConstant.heightRatio),
            pageController.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pageController.heightAnchor.constraint(equalToConstant: 12 * appConstant.heightRatio),
            
            scrollView.leadingAnchor.constraint(equalTo: scrollViewContainer.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: scrollViewContainer.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: scrollViewContainer.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: scrollViewContainer.bottomAnchor,constant: 0 * appConstant.heightRatio),
        
        ])
        
    }
    
    func createSlides() -> [UIView] {
        
       
        let slide1 = HealthhistoryController1.init()
        
        let slide2 = HealthhistoryController2.init()
       
        let slide3 = HealthhistoryController3.init()
        
        let slide4 = HealthhistoryController4.init()
        
        let slide5 = HealthhistoryController5.init()
       
        let slide6 = HealthhistoryController6.init()
        
        let slide7 = HealthhistoryController7.init()
        
        let slide8 = HealthhistoryController8.init()
       
        let slide9 = HealthhistoryController9.init()
        
        let slide10 = HealthhistoryController10.init()
        slide10.delegate = self
        
        return [slide1,slide2,slide3,slide4,slide5,slide6,slide7,slide8,slide9,slide10]
    }
    
    func setupSlideScrollView(slides : [UIView]) {
        scrollView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        scrollView.contentSize = CGSize(width: view.frame.width * CGFloat(slides.count), height: scrollViewContainer.frame.height)
        scrollView.isPagingEnabled = true
        
        for i in 0 ..< slides.count {
            slides[i].frame = CGRect(x: view.frame.width * CGFloat(i), y: 0, width: view.frame.width, height: view.frame.height)
            scrollView.addSubview(slides[i])
        }
    }

    
}

extension MainHealthHistoryController:Gotonext{
    func setnext() {
        if AppUserDefault.shared.isAppointment == true
        {
            alertWithMsg(vc: self, msg: "Appointment Created Successfully", title: "Alert!")
//            self.navigationController?.pushViewController(CustomTabBarController(), animated: true)
            let vc = CustomTabBarController()
            let rootNC = UINavigationController(rootViewController: vc)
            rootNC.navigationBar.isHidden = true
            UIApplication.shared.windows.first?.rootViewController = rootNC
            UIApplication.shared.windows.first?.makeKeyAndVisible()

        }
        else if isfromProfile == true
        {
            let vc = CustomTabBarController()
            vc.selectedIndex = 4
            let rootNC = UINavigationController(rootViewController: vc)
            rootNC.navigationBar.isHidden = true
            UIApplication.shared.windows.first?.rootViewController = rootNC
            UIApplication.shared.windows.first?.makeKeyAndVisible()
        }
        else
        {
            self.navigationController?.pushViewController(CompleteProfileController(), animated: true)
        }
    }
    
    
}


extension MainHealthHistoryController : UIScrollViewDelegate{
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x/view.frame.width)
        pageController.currentPage = Int(pageIndex)
    }
    @objc func moveToNextPage() {
        //width of scrollView
        let pageWidth:CGFloat = self.scrollView.frame.width
        //Maximum width of scrollView based on number of images needed to animate
        let maxWidth:CGFloat = pageWidth * CGFloat(slides.count)
        let contentOffset:CGFloat = self.scrollView.contentOffset.x
        var slideX = contentOffset + pageWidth
        if contentOffset + pageWidth == maxWidth{
        //When attain maximum width of scrollView make X = 0 to start from beginning.
            slideX = 0
        }
        
        
        currentPage = currentPage + 1
      
        self.scrollView.setContentOffset(CGPoint(x:slideX, y:0/*, width:pageWidth, height:self.scrollView.frame.height)*/), animated: true)
    }

}


extension MainHealthHistoryController : history1Delegate, history2Delegate, history3Delegate, history4Delegate, history5Delegate, history6Delegate, history7Delegate, history8Delegate, history9Delegate, history10Delegate
{
    func slider1BtnPress() {
        if !firstPage{
            firstPage = true
            moveToNextPage()
        }
    }
    
    func slider2BtnPress() {
        if !secondPage{
            secondPage = true
            moveToNextPage()
        }
    }
    
    func slider3BtnPress() {
        if !thirdPage{
            thirdPage = true
            moveToNextPage()
        }
    }
    
    func slider4BtnPress() {
        if !fourthPage{
            fourthPage = true
            moveToNextPage()
        }
    }
    
    func slider5BtnPress() {
        if !fivePage{
            fivePage = true
            moveToNextPage()
        }
    }
    
    func slider6BtnPress() {
        if !sixPage{
            sixPage = true
            moveToNextPage()
        }
    }
    
    func slider7BtnPress() {
        if !sevenPage{
            sevenPage = true
            moveToNextPage()
        }
    }
    
    func slider8BtnPress() {
        if !eightPage{
            eightPage = true
            moveToNextPage()
        }
    }
    
    func slider9BtnPress() {
        if !ninePage{
            ninePage = true
            moveToNextPage()
        }
    }
    
    func slider10BtnPress() {
//        if !te{
//            ninePage = true
//            moveToNextPage()
//        }
    }
    
    
}

