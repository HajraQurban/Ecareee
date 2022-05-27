//
//  DoctorMainBackgroundHistoryController.swift
//  HealthHub
//
//  Created by OBS on 26/01/2022.
//

import UIKit
import LGSideMenuController

class DoctorMainBackgroundHistoryController: BaseController {
    
    lazy var scrollViewContainer : UIView = {
        let view = UIView()
        view.backgroundColor = .clear
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
    
    
    
    lazy var buttonView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: Colors.AppColor)
        view.clipsToBounds = true
        view.layer.cornerRadius = 18 * appConstant.heightRatio
        //   view.layer.borderWidth = 1
        // view.layer.borderColor = textfieldBorderColor()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var buttonLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = .white
        lbl.textAlignment = .center
        lbl.backgroundColor = UIColor.clear
        lbl.font = bold(size: 15)
        lbl.text = "Next"
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var backbtnIcon: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "backIcon")
        iv.backgroundColor = UIColor.clear
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        //     iv.tintColor = redBtnColor()
        iv.clipsToBounds = true
        return iv
    }()
    
    
    lazy var nextBtn : CustomButton = {
        let btn = CustomButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = UIColor.clear
        btn.addTarget(self, action: #selector(nextBtn_press), for: .touchUpInside)
        return btn
    }()
    
    lazy var skipBtn : CustomButton = {
        let btn = CustomButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = UIColor.clear
        btn.setTitle("Skip", for: .normal)
        btn.setTitleColor(UIColor.black, for: .normal)
        //  btn.titleLabel?.font = UIFont(name:"Gill Sans", size: 20.0 * appConstant.heightRatio)
        btn.layer.shadowColor = UIColor.clear.cgColor
        btn.addTarget(self, action: #selector(skipBtn_press), for: .touchUpInside)
        return btn
    }()
    
    //
    var window: UIWindow?
    var mainController = UIViewController()
    
    
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
    
    var delegate : DoctorGotonext?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        headerLbl.text = "Background"
        self.view.backgroundColor = .white
        self.pageController.isHidden = true
        slides = createSlides()
        setupSlideScrollView(slides: slides)
        setup()
        
        buttonView.isHidden = false
        skipBtn.isHidden = false
        
        Doctorhistory1Data = self
        Doctorhistory2Data = self
        Doctorhistory3Data = self
        Doctorhistory4Data = self
        
        buttonView.isHidden = true
        skipBtn.isHidden = true
        //Calling THE Side Menu
        
        
    }
    
    func setup(){
        let margin = view.layoutMarginsGuide
        childView.addSubview(scrollViewContainer)
        scrollViewContainer.addSubview(scrollView)
        view.addSubview(pageController)
        
        view.addSubview(skipBtn)
        
        view.addSubview(buttonView)
        buttonView.addSubview(buttonLbl)
        buttonView.addSubview(backbtnIcon)
        buttonView.addSubview(nextBtn)
        
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
            
            
            skipBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 58 * appConstant.widthRatio),
            skipBtn.centerYAnchor.constraint(equalTo: buttonView.centerYAnchor),
            
            
            buttonView.bottomAnchor.constraint(equalTo: margin.bottomAnchor, constant: -20 * appConstant.heightRatio),
            buttonView.widthAnchor.constraint(equalToConstant: 180 * appConstant.heightRatio),
            buttonView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -30 * appConstant.widthRatio),
            buttonView.heightAnchor.constraint(equalToConstant: 48 * appConstant.heightRatio),
            
            nextBtn.topAnchor.constraint(equalTo: buttonView.topAnchor, constant: 0 * appConstant.heightRatio),
            nextBtn.leadingAnchor.constraint(equalTo: buttonView.leadingAnchor,constant: 0 * appConstant.widthRatio),
            nextBtn.trailingAnchor.constraint(equalTo: buttonView.trailingAnchor,constant: 0 * appConstant.widthRatio),
            nextBtn.bottomAnchor.constraint(equalTo: buttonView.bottomAnchor,constant: 0 * appConstant.heightRatio),
            
            buttonLbl.centerYAnchor.constraint(equalTo: buttonView.centerYAnchor, constant: 0 * appConstant.heightRatio),
            buttonLbl.centerXAnchor.constraint(equalTo: buttonView.centerXAnchor,constant: 0 * appConstant.widthRatio),
            //  buttonLbl.trailingAnchor.constraint(equalTo: buttonView.trailingAnchor,constant: 10 * appConstant.widthRatio),
            //            buttonLbl.bottomAnchor.constraint(equalTo: buttonView.bottomAnchor,constant: -10 * appConstant.heightRatio),
            
            
            backbtnIcon.centerYAnchor.constraint(equalTo: buttonView.centerYAnchor, constant: 0 * appConstant.heightRatio),
            backbtnIcon.trailingAnchor.constraint(equalTo: buttonView.trailingAnchor,constant: -23 * appConstant.widthRatio),
            backbtnIcon.heightAnchor.constraint(equalToConstant: 17 * appConstant.heightRatio),
            backbtnIcon.widthAnchor.constraint(equalToConstant: 18 * appConstant.heightRatio),
            
            
            
            
            
        ])
        
    }
    
    func setupsidemenu()
    {
        mainController = DoctorDashBoardController()
        let rootNavigationController = UINavigationController(rootViewController: mainController)
        rootNavigationController.navigationBar.isHidden = true
        let leftViewController = SideMenuViewController()
        // 3. Create instance of LGSideMenuController with above controllers as root and left.
        let sideMenuController = LGSideMenuController(rootViewController: rootNavigationController,
                                                      leftViewController: leftViewController)
        // 4. Set presentation style by your taste if you don't like the default one.
        sideMenuController.leftViewPresentationStyle = .slideAbove
        sideMenuController.isLeftViewSwipeGestureEnabled = false
        
        // 5. Set width for the left view if you don't like the default one.
        sideMenuController.leftViewWidth = 300 * appConstant.widthRatio
        // 6. Make it `rootViewController` for your window.
        //      self.window = UIWindow(frame: UIScreen.main.bounds)
        self.view.window?.rootViewController = sideMenuController
        self.view.window?.makeKeyAndVisible()
    }
    
    func createSlides() -> [UIView] {
        
        if isHworking == "Yes"
        {
            let slide1 = DoctorBackgroundHistoryView1.init()
            
            //        let slide2 = DoctorBackgroundHistoryView2.init()
            
            let slide3 = DoctorBackgroundHistoryView3.init()
            let slide4 = DoctorBackgroundHistoryView4.init()
            slide4.delegate = self
            
            return [slide1,slide3,slide4]
        }
        else
        {
            let slide1 = DoctorBackgroundHistoryView1.init()
            
            //        let slide2 = DoctorBackgroundHistoryView2.init()
            
            let slide3 = DoctorBackgroundHistoryView3.init()
            slide3.delegate = self
            let slide4 = DoctorBackgroundHistoryView4.init()
            
            return [slide1,slide3,slide4]
        }
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
    
    @objc func skipBtn_press(){
        if currentPage == 2{
            UserDefaults.standard.setValue(true, forKey: "onboarding")
        }
        setupsidemenu()
    }
    
    
    @objc func priviousBtn_press(){
        if currentPage == 0 {
            
        }else if currentPage == 1{
            self.currentPage = 0
            self.slideX = 0
            self.firstPage = false
            self.secondPage = false
            self.thirdPage = false
            self.fourthPage = false
            //   self.priviousBtn.isHidden = true
            self.scrollView.setContentOffset(CGPoint(x:0, y:0/*, width:pageWidth, height:self.scrollView.frame.height)*/), animated: true)
        }else if currentPage == 2{
            self.currentPage = 1
            let pageWidth:CGFloat = self.scrollView.frame.width
            self.slideX = Int(pageWidth)
            self.firstPage = true
            self.secondPage = false
            self.thirdPage = false
            self.fourthPage = false
            self.scrollView.setContentOffset(CGPoint(x:slideX, y:0/*, width:pageWidth, height:self.scrollView.frame.height)*/), animated: true)
            
        }
    }
    
    
}

extension DoctorMainBackgroundHistoryController:DoctorGotonext{
    func setnext() {
        self.navigationController?.pushViewController(DoctorDashBoardController(), animated: true)
    }
    
    
}


extension DoctorMainBackgroundHistoryController : UIScrollViewDelegate{
    
    
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


extension DoctorMainBackgroundHistoryController : Doctorhistory1Delegate, Doctorhistory2Delegate, Doctorhistory3Delegate, Doctorhistory4Delegate
{
    func slider1BtnPress() {
        if !firstPage{
            firstPage = true
            moveToNextPage()
        }
    }
    
    func slider2BtnPress() {
        if !secondPage{
            //            secondPage = true
            //            moveToNextPage()
        }
    }
    
    func slider3BtnPress() {
        if !thirdPage{
            thirdPage = true
            moveToNextPage()
//            setupsidemenu()
        }
    }
    
    func slider4BtnPress() {
        if !fourthPage{
            fourthPage = true
            //            moveToNextPage()
            setupsidemenu()
            
        }
    }
    
    @objc func nextBtn_press(){
        if currentPage == 0{
            slider1BtnPress()
        }else if currentPage == 1 {
            //            slider2BtnPress()
        }else if currentPage == 2{
            slider3BtnPress()
        }
        else if currentPage == 3{
            slider4BtnPress()
            
        }
        
    }
    
    
}


