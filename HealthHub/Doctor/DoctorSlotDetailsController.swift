


import UIKit
import Segmentio
import DatePicker
class DoctorSlotDetailsController: BaseController {
  lazy var scrollview : UIScrollView = {
    let SV = UIScrollView()
    SV.backgroundColor = UIColor.clear
    SV.translatesAutoresizingMaskIntoConstraints = false
    return SV
  }()
  lazy var containerView : UIView = {
    let view = UIView()
    view.backgroundColor = UIColor.white
    //    view.layer.cornerRadius = 18 * appConstant.heightRatio
    //    view.layer.shadowColor = UIColor.black.cgColor
    //    view.layer.shadowOpacity = 0.25
    //    view.layer.shadowOffset = CGSize(width: 0, height: 0)
    //    view.layer.shadowRadius = 18 * appConstant.heightRatio
    view.clipsToBounds = false
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  lazy var BookedcontainerView : UIView = {
    let view = UIView()
    view.backgroundColor = UIColor.white
    //    view.layer.cornerRadius = 18 * appConstant.heightRatio
    //    view.layer.shadowColor = UIColor.black.cgColor
    //    view.layer.shadowOpacity = 0.25
    //    view.layer.shadowOffset = CGSize(width: 0, height: 0)
    //    view.layer.shadowRadius = 18 * appConstant.heightRatio
    view.clipsToBounds = false
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  lazy var AddSlotcontainerView : UIView = {
    let view = UIView()
    view.backgroundColor = UIColor.white
    //    view.layer.cornerRadius = 18 * appConstant.heightRatio
    //    view.layer.shadowColor = UIColor.black.cgColor
    //    view.layer.shadowOpacity = 0.25
    //    view.layer.shadowOffset = CGSize(width: 0, height: 0)
    //    view.layer.shadowRadius = 18 * appConstant.heightRatio
    view.clipsToBounds = false
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  lazy var segmentsView : Segmentio = {
    let view = Segmentio()
    view.backgroundColor = .clear
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  lazy var ResultstitleLbl : UILabel = {
    let lbl = UILabel()
    lbl.clipsToBounds = true
    lbl.textColor = UIColor(named: Colors.PrimaryAppColor1)
    lbl.textAlignment = .left
    lbl.font = UIFont(name:"SFProDisplay-SemiBold", size: 15.0 * appConstant.heightRatio)
    lbl.text = "Results"
    lbl.numberOfLines = 0
    lbl.adjustsFontSizeToFitWidth = true
    lbl.sizeToFit()
    lbl.translatesAutoresizingMaskIntoConstraints = false
    return lbl
  }()
  lazy var ResultCountLbl : UILabel = {
    let lbl = UILabel()
    lbl.clipsToBounds = true
    lbl.backgroundColor = UIColor(named: Colors.TextfieldBG)
    lbl.layer.cornerRadius = 12 * appConstant.heightRatio
    lbl.textColor = UIColor.black
    lbl.textAlignment = .center
    lbl.font = UIFont(name:"SFProDisplay-SemiBold", size: 15.0 * appConstant.heightRatio)
    lbl.text = "0"
    lbl.numberOfLines = 0
    lbl.adjustsFontSizeToFitWidth = true
    lbl.sizeToFit()
    lbl.translatesAutoresizingMaskIntoConstraints = false
    return lbl
  }()
  lazy var bookResultCountLbl : UILabel = {
    let lbl = UILabel()
    lbl.clipsToBounds = true
    lbl.backgroundColor = UIColor(named: Colors.TextfieldBG)
    lbl.layer.cornerRadius = 12 * appConstant.heightRatio
    lbl.textColor = UIColor.black
    lbl.textAlignment = .center
    lbl.font = UIFont(name:"SFProDisplay-SemiBold", size: 15.0 * appConstant.heightRatio)
    lbl.text = "0"
    lbl.numberOfLines = 0
    lbl.adjustsFontSizeToFitWidth = true
    lbl.sizeToFit()
    lbl.translatesAutoresizingMaskIntoConstraints = false
    return lbl
  }()
  lazy var SearchTextFieldView : UIView = {
    let view = UIView()
    view.backgroundColor = UIColor(named: Colors.TextfieldBG)
    view.clipsToBounds = true
    view.isHidden = true
    view.layer.cornerRadius = 18 * appConstant.heightRatio
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  lazy var searchBtn : CustomButton = {
    let btn = CustomButton()
    btn.translatesAutoresizingMaskIntoConstraints = false
    btn.backgroundColor = UIColor.clear
    btn.layer.shadowOpacity = 0
    btn.setImage(UIImage(named: "SearchIcon"), for: .normal)
    //   btn.addTarget(self, action: #selector(searchbtn_press), for: .touchUpInside)
    return btn
  }()
  lazy var diseaseTF : UITextField = {
    let tf = UITextField()
    tf.placeholder = "Search"
    tf.backgroundColor = .clear
    tf.textColor = .black
    tf.font = regular(size: 15)
    tf.translatesAutoresizingMaskIntoConstraints = false
    return tf
  }()
  lazy var CrossBtn : CustomButton = {
    let btn = CustomButton()
    btn.translatesAutoresizingMaskIntoConstraints = false
    btn.backgroundColor = UIColor.clear
    btn.layer.shadowOpacity = 0
    btn.setImage(UIImage(named: "ClearIcon"), for: .normal)
    btn.addTarget(self, action: #selector(croosbtn_press), for: .touchUpInside)
    return btn
  }()
  lazy var logoImage : UIImageView = {
    let iv = UIImageView()
    iv.image = UIImage(named: "HistLogo2")
    iv.translatesAutoresizingMaskIntoConstraints = false
    iv.contentMode = .scaleAspectFill
    iv.clipsToBounds = true
    iv.isHidden = true
    return iv
  }()
  lazy var AvailableSlotTV : UITableView = {
    let tv = UITableView()
    tv.showsVerticalScrollIndicator = false
    tv.backgroundColor = UIColor.white
    tv.clipsToBounds = true
    //    tv.separatorStyle = .none
    //    tv.separatorStyle = .none
    tv.isScrollEnabled = true
    tv.isUserInteractionEnabled = true
    tv.translatesAutoresizingMaskIntoConstraints = false
    return tv
  }()
  lazy var BookedSlotTV : UITableView = {
    let tv = UITableView()
    tv.showsVerticalScrollIndicator = false
    tv.backgroundColor = UIColor.white
    tv.clipsToBounds = true
    //    tv.separatorStyle = .none
    //    tv.separatorStyle = .none
    tv.isScrollEnabled = true
    tv.isUserInteractionEnabled = true
    tv.translatesAutoresizingMaskIntoConstraints = false
    return tv
  }()
    
    
    lazy var SelectDatetitleLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .center
        lbl.font = bold(size: 18)
        lbl.text = "Select Date"
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
      }()
      lazy var SelectDateTextFieldView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: Colors.TextfieldBG)
        view.clipsToBounds = true
        view.layer.cornerRadius = 18 * appConstant.heightRatio
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
      }()
      lazy var SelectDateTftitlelbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .left
        lbl.font = medium(size: 11)
        lbl.text = "From"
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
      }()
      lazy var SelectDateTF : UITextField = {
        let tf = UITextField()
        tf.placeholder = "dd/mm/yyyy"
        tf.backgroundColor = .clear
        tf.textColor = .black
        tf.addToolbarInputAccessoryView(toolbarHeight: 44)
        tf.font = regular(size: 15)
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
      }()
      //
      lazy var SelectToDateTextFieldView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: Colors.TextfieldBG)
        view.clipsToBounds = true
        view.layer.cornerRadius = 18 * appConstant.heightRatio
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
      }()
      lazy var SelectToDateTftitlelbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .left
        lbl.font = medium(size: 11)
        lbl.text = "To"
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
      }()
      lazy var SelectToDateTF : UITextField = {
        let tf = UITextField()
        tf.placeholder = "dd/mm/yyyy"
        tf.backgroundColor = .clear
        tf.textColor = .black
        tf.addToolbarInputAccessoryView(toolbarHeight: 44)
        tf.font = regular(size: 15)
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
      }()
      //For Time
      lazy var SelectTimetitleLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .center
        lbl.font = bold(size: 18)
        lbl.text = "Select Time"
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
      }()
      lazy var SelectTimeTextFieldView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: Colors.TextfieldBG)
        view.clipsToBounds = true
        view.layer.cornerRadius = 18 * appConstant.heightRatio
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
      }()
      lazy var SelectTimeTftitlelbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .left
        lbl.font = medium(size: 11)
        lbl.text = "Start Time"
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
      }()
      lazy var SelectTimeTF : UITextField = {
        let tf = UITextField()
        tf.placeholder = "00:00"
        tf.backgroundColor = .clear
        tf.textColor = .black
        tf.addToolbarInputAccessoryView(toolbarHeight: 44)
        tf.font = regular(size: 15)
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
      }()
      //
      lazy var EndTimeTextFieldView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: Colors.TextfieldBG)
        view.clipsToBounds = true
        view.layer.cornerRadius = 18 * appConstant.heightRatio
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
      }()
      lazy var EndTimeTftitlelbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .left
        lbl.font = medium(size: 11)
        lbl.text = "End Time"
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
      }()
      lazy var EndTimeTF : UITextField = {
        let tf = UITextField()
        tf.placeholder = "00:00"
        tf.backgroundColor = .clear
        tf.textColor = .black
        tf.addToolbarInputAccessoryView(toolbarHeight: 44)
        tf.font = regular(size: 15)
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
      }()
      //
      lazy var DiscriptionTextFieldView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: Colors.TextfieldBG)
        view.clipsToBounds = true
        view.layer.cornerRadius = 18 * appConstant.heightRatio
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
      }()
      lazy var DiscriptionTftitlelbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .left
        lbl.font = medium(size: 11)
        lbl.text = "Description"
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
      }()
      lazy var DiscriptionTF : UITextField = {
        let tf = UITextField()
        tf.placeholder = "Enter the Slot Description"
        tf.backgroundColor = .clear
        tf.textColor = .black
        tf.addToolbarInputAccessoryView(toolbarHeight: 44)
        tf.font = regular(size: 15)
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
      }()
      lazy var SaveBtn : CustomButton = {
        let btn = CustomButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = UIColor(named: Colors.PrimaryAppColor1)
        btn.layer.cornerRadius = 18 * appConstant.heightRatio
        btn.titleLabel?.font = bold(size: 15)
        btn.setTitle("Save", for: .normal)
        btn.addTarget(self, action: #selector(savebtn_press), for: .touchUpInside)
        return btn
      }()
    
    lazy var nullAvalibleLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .center
        lbl.font = semiBold(size: 15)
        lbl.text = "No Available slot Yet"
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.isHidden  = true
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var nullBookedLbl : UILabel = {
        let lbl = UILabel()
        lbl.clipsToBounds = true
        lbl.textColor = UIColor.black
        lbl.textAlignment = .center
        lbl.font = semiBold(size: 15)
        lbl.text = "No Booked Slot Yet"
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        lbl.sizeToFit()
        lbl.isHidden  = true
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
      let Avail_manager = DoctorAvailableSlotManagers()
      var getAvailableSlotList = GetDoctorAvailableSlot()
      var deleteid = 0
      var slotCount = 0
      var bookslotCount = 0
      //
      let book_manager = DoctorBookedSlotManager()
      var getbookSlotList = GetDoctorAvailableSlot()
      let manager = DoctorAddSlot()
      let delManager = DoctorDeleteSlotManager()
      let delbookManager = DoctorDeleteBookedSlotManager()
      let thePicker = UIPickerView()
      lazy var timePicker : UIDatePicker = {
        let pic = UIDatePicker()
        var calendar = Calendar(identifier: .gregorian)
        let startOfDate = calendar.startOfDay(for: Date())
        pic.date =  startOfDate

        pic.translatesAutoresizingMaskIntoConstraints = false
        return pic
      }()
      lazy var EndtimePicker : UIDatePicker = {
        let pic = UIDatePicker()
        var calendar = Calendar(identifier: .gregorian)
        let startOfDate = calendar.startOfDay(for: Date())
        pic.date =  startOfDate
        pic.translatesAutoresizingMaskIntoConstraints = false
        return pic
      }()
      let slotnumb = ["Slot # 1","Slot # 2","Slot # 3","Slot # 4"]
      let bookslotnumb = ["Slot # 1","Slot # 2"]
      var starttime : [String] = [""]
      var endtime : [String] = [""]
      var desc = ["Abcd"]
      let segments = ["Add slots","Available slots","Booked slots"]
      var SelectedTime = Formatter.time.date(from: "00:00") ?? Date()


    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(sender:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(sender:)), name: UIResponder.keyboardWillHideNotification, object: nil)
   
        self.EndtimePicker.date = Date()
        self.timePicker.date = Date()
        
        setupSlotViews()
        headerLbl.text = "Slot details"
        backBtn.isHidden = true
        //    SelectDateTF.inputView = thePicker
        SelectDateTF.delegate = self
        SelectToDateTF.delegate = self
        SelectTimeTF.delegate = self
        EndTimeTF.delegate = self
        SelectTimeTF.isUserInteractionEnabled = false
        EndTimeTF.isUserInteractionEnabled = false
        creatTimePicker()
        creatEndTimePicker()
        timePicker.addTarget(self, action: #selector(datePickerChanged(datePicker:)), for: .valueChanged)
        EndtimePicker.addTarget(self, action: #selector(self.valueChanged(_:)), for: .valueChanged)
        DiscriptionTF.addTarget(self, action: #selector(textvalueChanged), for: .valueChanged)
        AvailableSlotTV.delegate = self
        AvailableSlotTV.dataSource = self
        AvailableSlotTV.register(AvailableSlotTVCell.self, forCellReuseIdentifier: AvailableSlotTVCell.cellidentifier)
        BookedSlotTV.delegate = self
        BookedSlotTV.dataSource = self
        BookedSlotTV.register(AvailableSlotTVCell.self, forCellReuseIdentifier: AvailableSlotTVCell.cellidentifier)
        setup()
        setupaddSlots()
      }
      func setup()
      {
        let margin = view.layoutMarginsGuide
        //    view.addSubview(scrollview)
        childView.addSubview(segmentsView)
        NSLayoutConstraint.activate([
          segmentsView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 0 * appConstant.heightRatio),
          segmentsView.trailingAnchor.constraint(equalTo: childView.trailingAnchor,constant: 0 * appConstant.heightRatio),
          segmentsView.leadingAnchor.constraint(equalTo: childView.leadingAnchor, constant: 0 * appConstant.widthRatio),
          segmentsView.heightAnchor.constraint(equalToConstant: 60 * appConstant.heightRatio),
        ])
      }
      func setupSlotViews() {
        self.segmentsView.setupSegmentio(titles: segments)
        self.segmentsView.selectedSegmentioIndex = 0
        //      self.setupaddSlots()
        //safe
        self.segmentsView.valueDidChange = { segmentio, segmentIndex in
          print(segmentIndex)
          if self.segmentsView.selectedSegmentioIndex == 0
          {
            self.setupaddSlots()
            self.containerView.isHidden = true
            self.BookedcontainerView.isHidden = true
            self.AddSlotcontainerView.isHidden = false
          }
          else if self.segmentsView.selectedSegmentioIndex == 1
          {
            self.setupAvailableSlot()
            self.getdoctoravailslotlist()
            self.containerView.isHidden = false
            self.BookedcontainerView.isHidden = true
            self.AddSlotcontainerView.isHidden = true
          }
          else if self.segmentsView.selectedSegmentioIndex == 2
          {
            self.setupBookedSlot()
            self.getdoctorbookslotlist()
            self.containerView.isHidden = true
            self.BookedcontainerView.isHidden = false
            self.AddSlotcontainerView.isHidden = true
          }
        }
      }
    
    
    
    func setupSlotViews1() {
      self.segmentsView.setupSegmentio(titles: segments)
//      self.segmentsView.selectedSegmentioIndex = 0
      //      self.setupaddSlots()
      //safe
      self.segmentsView.valueDidChange = { segmentio, segmentIndex in
        print(segmentIndex)
        if self.segmentsView.selectedSegmentioIndex == 0
        {
          self.setupaddSlots()
          self.containerView.isHidden = true
          self.BookedcontainerView.isHidden = true
          self.AddSlotcontainerView.isHidden = false
        }
        else if self.segmentsView.selectedSegmentioIndex == 1
        {
          self.setupAvailableSlot()
          self.getdoctoravailslotlist()
          self.containerView.isHidden = false
          self.BookedcontainerView.isHidden = true
          self.AddSlotcontainerView.isHidden = true
        }
        else if self.segmentsView.selectedSegmentioIndex == 2
        {
          self.setupBookedSlot()
          self.getdoctorbookslotlist()
          self.containerView.isHidden = true
          self.BookedcontainerView.isHidden = false
          self.AddSlotcontainerView.isHidden = true
        }
      }
    }
    
    
    
    
    
      func setupAvailableSlot()
      {
          let margin = view.layoutMarginsGuide
        childView.addSubview(containerView)
        containerView.addSubview(ResultstitleLbl)
        containerView.addSubview(ResultCountLbl)
        containerView.addSubview(SearchTextFieldView)
        SearchTextFieldView.addSubview(searchBtn)
        SearchTextFieldView.addSubview(diseaseTF)
        SearchTextFieldView.addSubview(CrossBtn)
        
        childView.addSubview(AvailableSlotTV)
        childView.addSubview(logoImage)
        childView.addSubview(nullAvalibleLbl)
        NSLayoutConstraint.activate([
          containerView.leadingAnchor.constraint(equalTo: childView.leadingAnchor, constant: 0 * appConstant.widthRatio),
          containerView.trailingAnchor.constraint(equalTo: childView.trailingAnchor, constant: 0 * appConstant.widthRatio),
          containerView.topAnchor.constraint(equalTo: self.segmentsView.bottomAnchor, constant: 0 * appConstant.heightRatio),
          containerView.bottomAnchor.constraint(equalTo: childView.bottomAnchor,constant: 30 * appConstant.heightRatio),
          containerView.widthAnchor.constraint(equalToConstant: 375 * appConstant.widthRatio),
          ResultstitleLbl.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 30 * appConstant.heightRatio),
          ResultstitleLbl.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 23 * appConstant.widthRatio),
          ResultstitleLbl.heightAnchor.constraint(equalToConstant: 24 * appConstant.heightRatio),
          ResultCountLbl.centerYAnchor.constraint(equalTo: ResultstitleLbl.centerYAnchor, constant: 0 * appConstant.heightRatio),
          ResultCountLbl.leadingAnchor.constraint(equalTo: ResultstitleLbl.leadingAnchor, constant: 70 * appConstant.heightRatio),
          ResultCountLbl.heightAnchor.constraint(equalToConstant: 24 * appConstant.heightRatio),
          ResultCountLbl.widthAnchor.constraint(equalToConstant: 35 * appConstant.heightRatio),
          SearchTextFieldView.centerYAnchor.constraint(equalTo: ResultCountLbl.centerYAnchor, constant: 0 * appConstant.heightRatio),
          SearchTextFieldView.leadingAnchor.constraint(equalTo: ResultCountLbl.trailingAnchor, constant: 15 * appConstant.heightRatio),
          SearchTextFieldView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20 * appConstant.heightRatio),
          SearchTextFieldView.heightAnchor.constraint(equalToConstant: 48 * appConstant.heightRatio),
          searchBtn.topAnchor.constraint(equalTo: SearchTextFieldView.topAnchor, constant: 14 * appConstant.heightRatio),
          searchBtn.leadingAnchor.constraint(equalTo: SearchTextFieldView.leadingAnchor, constant: 10 * appConstant.heightRatio),
          searchBtn.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
          searchBtn.widthAnchor.constraint(equalToConstant: 20 * appConstant.widthRatio),
          diseaseTF.topAnchor.constraint(equalTo: SearchTextFieldView.topAnchor, constant: 14 * appConstant.heightRatio),
          diseaseTF.leadingAnchor.constraint(equalTo: searchBtn.trailingAnchor, constant: 8 * appConstant.heightRatio),
          diseaseTF.trailingAnchor.constraint(equalTo: SearchTextFieldView.trailingAnchor, constant: -80 * appConstant.heightRatio),
          diseaseTF.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
          CrossBtn.centerYAnchor.constraint(equalTo: diseaseTF.centerYAnchor, constant: 0 * appConstant.heightRatio),
          CrossBtn.topAnchor.constraint(equalTo: SearchTextFieldView.topAnchor, constant: 14 * appConstant.heightRatio),
          CrossBtn.trailingAnchor.constraint(equalTo: SearchTextFieldView.trailingAnchor, constant: -18 * appConstant.heightRatio),
          CrossBtn.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
          CrossBtn.widthAnchor.constraint(equalToConstant: 20 * appConstant.widthRatio),
          logoImage.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
          logoImage.topAnchor.constraint(equalTo: SearchTextFieldView.bottomAnchor,constant: 20 * appConstant.heightRatio),
          logoImage.heightAnchor.constraint(equalToConstant: 283 * appConstant.heightRatio),
          logoImage.widthAnchor.constraint(equalToConstant: 313 * appConstant.heightRatio),
          
          AvailableSlotTV.topAnchor.constraint(equalTo: logoImage.topAnchor, constant: 0 * appConstant.heightRatio),
          AvailableSlotTV.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20 * appConstant.heightRatio),
          AvailableSlotTV.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20 * appConstant.heightRatio),
          AvailableSlotTV.bottomAnchor.constraint(equalTo: margin.bottomAnchor, constant: 0 * appConstant.heightRatio),
          //      AvailableSlotTV.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -0 * appConstant.heightRatio),
          
          nullAvalibleLbl.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 12 * appConstant.heightRatio),
          nullAvalibleLbl.centerXAnchor.constraint(equalTo: containerView.centerXAnchor, constant: 0),
        ])
      }
    
    func setupBookedSlot()
      {
          let margin = view.layoutMarginsGuide
        childView.addSubview(BookedcontainerView)
        BookedcontainerView.addSubview(ResultstitleLbl)
        BookedcontainerView.addSubview(bookResultCountLbl)
        BookedcontainerView.addSubview(SearchTextFieldView)
        SearchTextFieldView.addSubview(searchBtn)
        SearchTextFieldView.addSubview(diseaseTF)
        SearchTextFieldView.addSubview(CrossBtn)
        
        BookedcontainerView.addSubview(BookedSlotTV)
        BookedcontainerView.addSubview(logoImage)
        BookedcontainerView.addSubview(nullBookedLbl)
        NSLayoutConstraint.activate([
          BookedcontainerView.leadingAnchor.constraint(equalTo: childView.leadingAnchor, constant: 0 * appConstant.widthRatio),
          BookedcontainerView.trailingAnchor.constraint(equalTo: childView.trailingAnchor, constant: 0 * appConstant.widthRatio),
          BookedcontainerView.topAnchor.constraint(equalTo: self.segmentsView.bottomAnchor, constant: 0 * appConstant.heightRatio),
          BookedcontainerView.bottomAnchor.constraint(equalTo: childView.bottomAnchor,constant: 30 * appConstant.heightRatio),
          BookedcontainerView.widthAnchor.constraint(equalToConstant: 375 * appConstant.widthRatio),
          ResultstitleLbl.topAnchor.constraint(equalTo: BookedcontainerView.topAnchor, constant: 30 * appConstant.heightRatio),
          ResultstitleLbl.leadingAnchor.constraint(equalTo: BookedcontainerView.leadingAnchor, constant: 23 * appConstant.widthRatio),
          ResultstitleLbl.heightAnchor.constraint(equalToConstant: 24 * appConstant.heightRatio),
          bookResultCountLbl.centerYAnchor.constraint(equalTo: ResultstitleLbl.centerYAnchor, constant: 0 * appConstant.heightRatio),
          bookResultCountLbl.leadingAnchor.constraint(equalTo: ResultstitleLbl.leadingAnchor, constant: 70 * appConstant.heightRatio),
          bookResultCountLbl.heightAnchor.constraint(equalToConstant: 24 * appConstant.heightRatio),
          bookResultCountLbl.widthAnchor.constraint(equalToConstant: 35 * appConstant.heightRatio),
          SearchTextFieldView.centerYAnchor.constraint(equalTo: bookResultCountLbl.centerYAnchor, constant: 0 * appConstant.heightRatio),
          SearchTextFieldView.leadingAnchor.constraint(equalTo: bookResultCountLbl.trailingAnchor, constant: 15 * appConstant.heightRatio),
          SearchTextFieldView.trailingAnchor.constraint(equalTo: BookedcontainerView.trailingAnchor, constant: -20 * appConstant.heightRatio),
          SearchTextFieldView.heightAnchor.constraint(equalToConstant: 48 * appConstant.heightRatio),
          searchBtn.topAnchor.constraint(equalTo: SearchTextFieldView.topAnchor, constant: 14 * appConstant.heightRatio),
          searchBtn.leadingAnchor.constraint(equalTo: SearchTextFieldView.leadingAnchor, constant: 10 * appConstant.heightRatio),
          searchBtn.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
          searchBtn.widthAnchor.constraint(equalToConstant: 20 * appConstant.widthRatio),
          diseaseTF.topAnchor.constraint(equalTo: SearchTextFieldView.topAnchor, constant: 14 * appConstant.heightRatio),
          diseaseTF.leadingAnchor.constraint(equalTo: searchBtn.trailingAnchor, constant: 8 * appConstant.heightRatio),
          diseaseTF.trailingAnchor.constraint(equalTo: SearchTextFieldView.trailingAnchor, constant: -80 * appConstant.heightRatio),
          diseaseTF.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
          CrossBtn.centerYAnchor.constraint(equalTo: diseaseTF.centerYAnchor, constant: 0 * appConstant.heightRatio),
          CrossBtn.topAnchor.constraint(equalTo: SearchTextFieldView.topAnchor, constant: 14 * appConstant.heightRatio),
          CrossBtn.trailingAnchor.constraint(equalTo: SearchTextFieldView.trailingAnchor, constant: -18 * appConstant.heightRatio),
          CrossBtn.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
          CrossBtn.widthAnchor.constraint(equalToConstant: 20 * appConstant.widthRatio),
          logoImage.centerXAnchor.constraint(equalTo: BookedcontainerView.centerXAnchor),
          logoImage.topAnchor.constraint(equalTo: SearchTextFieldView.bottomAnchor,constant: 20 * appConstant.heightRatio),
          logoImage.heightAnchor.constraint(equalToConstant: 283 * appConstant.heightRatio),
          logoImage.widthAnchor.constraint(equalToConstant: 313 * appConstant.heightRatio),
          
          BookedSlotTV.topAnchor.constraint(equalTo: logoImage.topAnchor, constant: 0 * appConstant.heightRatio),
          BookedSlotTV.leadingAnchor.constraint(equalTo: BookedcontainerView.leadingAnchor, constant: 20 * appConstant.heightRatio),
          BookedSlotTV.trailingAnchor.constraint(equalTo: BookedcontainerView.trailingAnchor, constant: -20 * appConstant.heightRatio),
          BookedSlotTV.bottomAnchor.constraint(equalTo: margin.bottomAnchor, constant: 0 * appConstant.heightRatio),
          //      BookedSlotTV.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -0 * appConstant.heightRatio),
          
          nullBookedLbl.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 12 * appConstant.heightRatio),
          nullBookedLbl.centerXAnchor.constraint(equalTo: BookedcontainerView.centerXAnchor, constant: 0),
        ])
      }


    func setupaddSlots()
         {
           childView.addSubview(AddSlotcontainerView)
           AddSlotcontainerView.addSubview(SelectDatetitleLbl)
           AddSlotcontainerView.addSubview(SelectDateTextFieldView)
           SelectDateTextFieldView.addSubview(SelectDateTftitlelbl)
           SelectDateTextFieldView.addSubview(SelectDateTF)
           AddSlotcontainerView.addSubview(SelectToDateTextFieldView)
           SelectToDateTextFieldView.addSubview(SelectToDateTftitlelbl)
           SelectToDateTextFieldView.addSubview(SelectToDateTF)
           AddSlotcontainerView.addSubview(SelectTimetitleLbl)
           AddSlotcontainerView.addSubview(SelectTimeTextFieldView)
           SelectTimeTextFieldView.addSubview(timePicker)
           SelectTimeTextFieldView.addSubview(SelectTimeTftitlelbl)
           SelectTimeTextFieldView.addSubview(SelectTimeTF)
           AddSlotcontainerView.addSubview(EndTimeTextFieldView)
           EndTimeTextFieldView.addSubview(EndtimePicker)
           EndTimeTextFieldView.addSubview(EndTimeTftitlelbl)
           EndTimeTextFieldView.addSubview(EndTimeTF)
           AddSlotcontainerView.addSubview(DiscriptionTextFieldView)
           DiscriptionTextFieldView.addSubview(DiscriptionTftitlelbl)
           DiscriptionTextFieldView.addSubview(DiscriptionTF)
           AddSlotcontainerView.addSubview(SaveBtn)
           NSLayoutConstraint.activate([
             AddSlotcontainerView.leadingAnchor.constraint(equalTo: childView.leadingAnchor, constant: 0 * appConstant.widthRatio),
             AddSlotcontainerView.trailingAnchor.constraint(equalTo: childView.trailingAnchor, constant: 0 * appConstant.widthRatio),
             AddSlotcontainerView.topAnchor.constraint(equalTo: self.segmentsView.bottomAnchor, constant: 0 * appConstant.heightRatio),
             AddSlotcontainerView.bottomAnchor.constraint(equalTo: childView.bottomAnchor,constant: 30 * appConstant.heightRatio),
             AddSlotcontainerView.widthAnchor.constraint(equalToConstant: 375 * appConstant.widthRatio),
             
             
             SelectDatetitleLbl.topAnchor.constraint(equalTo: AddSlotcontainerView.topAnchor, constant: 12 * appConstant.heightRatio),
             SelectDatetitleLbl.leadingAnchor.constraint(equalTo: AddSlotcontainerView.leadingAnchor, constant: 23 * appConstant.widthRatio),
             SelectDatetitleLbl.heightAnchor.constraint(equalToConstant: 24 * appConstant.heightRatio),
             //      timePicker.centerXAnchor.constraint(equalTo: SelectDateTextFieldView.centerXAnchor, constant: 0 * appConstant.heightRatio),
             
             timePicker.trailingAnchor.constraint(equalTo: SelectTimeTextFieldView.trailingAnchor, constant: -20 * appConstant.widthRatio),
             timePicker.centerYAnchor.constraint(equalTo: SelectTimeTextFieldView.centerYAnchor, constant: 0 * appConstant.heightRatio),
             timePicker.heightAnchor.constraint(equalToConstant: 100 * appConstant.heightRatio),
             timePicker.widthAnchor.constraint(equalToConstant: 120 * appConstant.widthRatio),
             
             SelectDateTextFieldView.topAnchor.constraint(equalTo: SelectDatetitleLbl.bottomAnchor, constant: 20 * appConstant.heightRatio),
             SelectDateTextFieldView.leadingAnchor.constraint(equalTo: AddSlotcontainerView.leadingAnchor, constant: 20 * appConstant.widthRatio),
       //      SelectDateTextFieldView.trailingAnchor.constraint(equalTo: AddSlotcontainerView.trailingAnchor, constant: -20 * appConstant.widthRatio),
             SelectDateTextFieldView.heightAnchor.constraint(equalToConstant: 64 * appConstant.heightRatio),
             SelectDateTextFieldView.heightAnchor.constraint(equalToConstant: 90 * appConstant.heightRatio),
             
             
             SelectDateTftitlelbl.topAnchor.constraint(equalTo: SelectDateTextFieldView.topAnchor, constant: 8 * appConstant.heightRatio),
             SelectDateTftitlelbl.leadingAnchor.constraint(equalTo: SelectDateTextFieldView.leadingAnchor, constant: 20 * appConstant.heightRatio),
             SelectDateTftitlelbl.heightAnchor.constraint(equalToConstant: 16 * appConstant.heightRatio),
             
             
             SelectDateTF.topAnchor.constraint(equalTo: SelectDateTftitlelbl.bottomAnchor, constant: 5 * appConstant.heightRatio),
             SelectDateTF.leadingAnchor.constraint(equalTo: SelectDateTextFieldView.leadingAnchor, constant: 20 * appConstant.heightRatio),
             SelectDateTF.trailingAnchor.constraint(equalTo: SelectDateTextFieldView.trailingAnchor, constant: -20 * appConstant.heightRatio),
             SelectDateTF.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
             
             
             //
             SelectToDateTextFieldView.topAnchor.constraint(equalTo: SelectDatetitleLbl.bottomAnchor, constant: 20 * appConstant.heightRatio),
             SelectToDateTextFieldView.leadingAnchor.constraint(equalTo: SelectDateTextFieldView.trailingAnchor, constant: 20 * appConstant.widthRatio),
       //      SelectToDateTextFieldView.trailingAnchor.constraint(equalTo: AddSlotcontainerView.trailingAnchor, constant: -20 * appConstant.widthRatio),
             SelectToDateTextFieldView.heightAnchor.constraint(equalToConstant: 64 * appConstant.heightRatio),
             SelectToDateTextFieldView.heightAnchor.constraint(equalToConstant: 90 * appConstant.heightRatio),
             
             
             SelectToDateTftitlelbl.topAnchor.constraint(equalTo: SelectToDateTextFieldView.topAnchor, constant: 8 * appConstant.heightRatio),
             SelectToDateTftitlelbl.leadingAnchor.constraint(equalTo: SelectToDateTextFieldView.leadingAnchor, constant: 20 * appConstant.heightRatio),
             SelectToDateTftitlelbl.heightAnchor.constraint(equalToConstant: 16 * appConstant.heightRatio),
             
             
             SelectToDateTF.topAnchor.constraint(equalTo: SelectDateTftitlelbl.bottomAnchor, constant: 5 * appConstant.heightRatio),
             SelectToDateTF.leadingAnchor.constraint(equalTo: SelectToDateTextFieldView.leadingAnchor, constant: 20 * appConstant.heightRatio),
             SelectToDateTF.trailingAnchor.constraint(equalTo: SelectToDateTextFieldView.trailingAnchor, constant: -20 * appConstant.heightRatio),
             SelectToDateTF.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
             
             
             //
             SelectTimetitleLbl.topAnchor.constraint(equalTo: SelectDateTextFieldView.bottomAnchor, constant: 12 * appConstant.heightRatio),
             SelectTimetitleLbl.leadingAnchor.constraint(equalTo: AddSlotcontainerView.leadingAnchor, constant: 23 * appConstant.widthRatio),
             SelectTimetitleLbl.heightAnchor.constraint(equalToConstant: 24 * appConstant.heightRatio),
             SelectTimeTextFieldView.topAnchor.constraint(equalTo: SelectTimetitleLbl.bottomAnchor, constant: 20 * appConstant.heightRatio),
             
             
             SelectTimeTextFieldView.leadingAnchor.constraint(equalTo: AddSlotcontainerView.leadingAnchor, constant: 20 * appConstant.widthRatio),
             SelectTimeTextFieldView.trailingAnchor.constraint(equalTo: AddSlotcontainerView.trailingAnchor, constant: -20 * appConstant.widthRatio),
             SelectTimeTextFieldView.heightAnchor.constraint(equalToConstant: 64 * appConstant.heightRatio),
             
             
             SelectTimeTftitlelbl.topAnchor.constraint(equalTo: SelectTimeTextFieldView.topAnchor, constant: 8 * appConstant.heightRatio),
             SelectTimeTftitlelbl.leadingAnchor.constraint(equalTo: SelectTimeTextFieldView.leadingAnchor, constant: 20 * appConstant.heightRatio),
             SelectTimeTftitlelbl.heightAnchor.constraint(equalToConstant: 16 * appConstant.heightRatio),
             
             
             SelectTimeTF.topAnchor.constraint(equalTo: SelectTimeTftitlelbl.bottomAnchor, constant: 5 * appConstant.heightRatio),
             SelectTimeTF.leadingAnchor.constraint(equalTo: SelectTimeTextFieldView.leadingAnchor, constant: 20 * appConstant.heightRatio),
             SelectTimeTF.trailingAnchor.constraint(equalTo: SelectTimeTextFieldView.trailingAnchor, constant: -20 * appConstant.heightRatio),
             SelectTimeTF.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
             
             //
             EndTimeTextFieldView.topAnchor.constraint(equalTo: SelectTimeTextFieldView.bottomAnchor, constant: 20 * appConstant.heightRatio),
             EndTimeTextFieldView.leadingAnchor.constraint(equalTo: AddSlotcontainerView.leadingAnchor, constant: 20 * appConstant.widthRatio),
             EndTimeTextFieldView.trailingAnchor.constraint(equalTo: AddSlotcontainerView.trailingAnchor, constant: -20 * appConstant.widthRatio),
             EndTimeTextFieldView.heightAnchor.constraint(equalToConstant: 64 * appConstant.heightRatio),
             
             
             
             EndtimePicker.trailingAnchor.constraint(equalTo: EndTimeTextFieldView.trailingAnchor, constant: -20 * appConstant.widthRatio),
             EndtimePicker.centerYAnchor.constraint(equalTo: EndTimeTextFieldView.centerYAnchor, constant: 0 * appConstant.heightRatio),
             EndtimePicker.heightAnchor.constraint(equalToConstant: 100 * appConstant.heightRatio),
             EndtimePicker.widthAnchor.constraint(equalToConstant: 120 * appConstant.widthRatio),
             
             EndTimeTftitlelbl.topAnchor.constraint(equalTo: EndTimeTextFieldView.topAnchor, constant: 8 * appConstant.heightRatio),
             EndTimeTftitlelbl.leadingAnchor.constraint(equalTo: EndTimeTextFieldView.leadingAnchor, constant: 20 * appConstant.heightRatio),
             EndTimeTftitlelbl.heightAnchor.constraint(equalToConstant: 16 * appConstant.heightRatio),
             
             EndTimeTF.topAnchor.constraint(equalTo: EndTimeTftitlelbl.bottomAnchor, constant: 5 * appConstant.heightRatio),
             EndTimeTF.leadingAnchor.constraint(equalTo: EndTimeTextFieldView.leadingAnchor, constant: 20 * appConstant.heightRatio),
             EndTimeTF.trailingAnchor.constraint(equalTo: EndTimeTextFieldView.trailingAnchor, constant: -20 * appConstant.heightRatio),
             EndTimeTF.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
             //
             DiscriptionTextFieldView.topAnchor.constraint(equalTo: EndTimeTextFieldView.bottomAnchor, constant: 20 * appConstant.heightRatio),
             DiscriptionTextFieldView.leadingAnchor.constraint(equalTo: AddSlotcontainerView.leadingAnchor, constant: 20 * appConstant.widthRatio),
             DiscriptionTextFieldView.trailingAnchor.constraint(equalTo: AddSlotcontainerView.trailingAnchor, constant: -20 * appConstant.widthRatio),
             DiscriptionTextFieldView.heightAnchor.constraint(equalToConstant: 64 * appConstant.heightRatio),
             
             DiscriptionTftitlelbl.topAnchor.constraint(equalTo: DiscriptionTextFieldView.topAnchor, constant: 8 * appConstant.heightRatio),
             DiscriptionTftitlelbl.leadingAnchor.constraint(equalTo: DiscriptionTextFieldView.leadingAnchor, constant: 20 * appConstant.heightRatio),
             DiscriptionTftitlelbl.heightAnchor.constraint(equalToConstant: 16 * appConstant.heightRatio),
             
             DiscriptionTF.topAnchor.constraint(equalTo: DiscriptionTftitlelbl.bottomAnchor, constant: 5 * appConstant.heightRatio),
             DiscriptionTF.leadingAnchor.constraint(equalTo: DiscriptionTextFieldView.leadingAnchor, constant: 20 * appConstant.heightRatio),
             DiscriptionTF.trailingAnchor.constraint(equalTo: DiscriptionTextFieldView.trailingAnchor, constant: -20 * appConstant.heightRatio),
             DiscriptionTF.heightAnchor.constraint(equalToConstant: 20 * appConstant.heightRatio),
             
             SaveBtn.topAnchor.constraint(equalTo: DiscriptionTextFieldView.bottomAnchor, constant: 24 * appConstant.heightRatio),
             SaveBtn.leadingAnchor.constraint(equalTo: AddSlotcontainerView.leadingAnchor, constant: 20 * appConstant.widthRatio),
             SaveBtn.trailingAnchor.constraint(equalTo: AddSlotcontainerView.trailingAnchor, constant: -20 * appConstant.widthRatio),
             SaveBtn.heightAnchor.constraint(equalToConstant: 64 * appConstant.heightRatio),
           ])
         }

    func postaddSlotData(){
            let parameters: [String: Any] = ["from" : (SelectDateTF.text ?? "") as String,
                                             "to" : (SelectToDateTF.text ?? "") as String,
                                             "start_time" : starttime as [String],
                                             "end_time" : endtime as [String],
                                             "description" : (DiscriptionTF.text ?? "") as String,
            ]
            ActivityIndicator.shared.showSpinner(onView: self.view)
            // loadingView.show(on: self)
            // let headers: [String: AnyObject] = ["Accept": "application/json"]
            manager.doctoraddSlot(params: parameters) { [self] msg, hasError in
                ActivityIndicator.shared.removeSpinner()
                // RSLoadingView.hide(from: self)
                if hasError{
                    print(hasError)
                    ActivityIndicator.shared.removeSpinner()
                    //   alertWithMsg(vc: self, msg: msg, title: "Error!")
                }else{
                    print(msg)
                    self.DiscriptionTF.text = ""
                    self.SelectTimeTF.text = ""
                    self.EndTimeTF.text = ""
                    self.SelectToDateTF.text = ""
                    self.SelectDateTF.text = ""
                    var calendar = Calendar(identifier: .gregorian)
                    let startOfDate = calendar.startOfDay(for: Date())
                    EndtimePicker.date =  startOfDate

                    self.EndtimePicker.date = startOfDate
                    self.timePicker.date = startOfDate
                   
                    //            alertWithMsg(vc: self, msg: msg, title: "Alert!")
                    // Create the alert controller
                    let alertController = UIAlertController(title: "Alert", message: msg, preferredStyle: .alert)
                    // Create the actions
                    let okAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default) {
                        UIAlertAction in
                        
                        DispatchQueue.main.async {
                            self.segmentsView.selectedSegmentioIndex = 1
                            setupSlotViews1()
                        }
                        
                    }
                    // Add the actions
                    alertController.addAction(okAction)
                    
                    // Present the controller
                    self.present(alertController, animated: true, completion: nil)
                    print("Success")
                    self.view.endEditing(true)
                }
            }
        }
      func getdoctoravailslotlist()
      {
          nullBookedLbl.isHidden = true
          logoImage.isHidden = false
          self.AvailableSlotTV.isHidden = true
          self.BookedSlotTV.isHidden = true
        DispatchQueue.main.async {
        ActivityIndicator.shared.showSpinner(onView: self.view)
        }
        Avail_manager.availableslotlist{ docdata, msg, hasError in
          DispatchQueue.main.async {
            ActivityIndicator.shared.removeSpinner()
          }
          if hasError{
            //  RSLoadingView.hide(from: self.view)
            alertWithMsg(vc: self, msg: msg, title: "Error!")
          }else{
            if docdata!.data!.count > 0
            {
              //  RSLoadingView.hide(from: self.view)
                self.nullAvalibleLbl.isHidden = true
              self.getAvailableSlotList = docdata!
                self.AvailableSlotTV.isHidden = false
                self.logoImage.isHidden = true
              self.AvailableSlotTV.reloadData()
            }
            else
            {
                self.logoImage.isHidden = false
                self.nullAvalibleLbl.isHidden = false
                self.AvailableSlotTV.isHidden = true
//              alertWithMsg(vc: self, msg: "No Available slot Yet", title: "Alert!")
            }
          }
        }
      }
      //
      func getdoctorbookslotlist()
      {
        // loadingView.show(on: view)
          self.nullAvalibleLbl.isHidden = true
          self.logoImage.isHidden = false
          self.AvailableSlotTV.isHidden = true
          self.BookedSlotTV.isHidden = true
        DispatchQueue.main.async {
        ActivityIndicator.shared.showSpinner(onView: self.view)
        }
        book_manager.bookedslotlist{ docdata, msg, hasError in
          DispatchQueue.main.async {
        ActivityIndicator.shared.removeSpinner()
          }
          if hasError{
            //  RSLoadingView.hide(from: self.view)
            alertWithMsg(vc: self, msg: msg, title: "Error!")
          }else{
            if docdata!.data!.count > 0
            {
              //  RSLoadingView.hide(from: self.view)
              self.getbookSlotList = docdata!
                self.BookedSlotTV.isHidden = false
                self.nullBookedLbl.isHidden = true
                self.logoImage.isHidden = true
              self.BookedSlotTV.reloadData()
            }
            else
            {
                self.logoImage.isHidden = false
                self.nullBookedLbl.isHidden = false
                self.BookedSlotTV.isHidden = true
//              alertWithMsg(vc: self, msg: "No Booked slot Yet", title: "Alert!")
            }
          }
        }
      }
      @objc func croosbtn_press(){
        diseaseTF.text = " "
      }
      @objc override func backbtn_press(){
        self.dismiss(animated: true)
      }
      @objc func savebtn_press(){
        let valid = validate()
        if !valid.1{
          alertWithMsg(vc: self, msg: valid.0 ?? "All fields requird", title: "Alert!")
        }else{
          self.view.endEditing(true)
          postaddSlotData()
        }
      }
    
    @objc func keyboardWillShow(sender: NSNotification) {
         self.view.frame.origin.y = -200 // Move view 150 points upward
    }
    @objc func keyboardWillHide(sender: NSNotification) {
         self.view.frame.origin.y = 0 // Move view to original position
    }
    
      @objc func openDatePicker() {
        //    DatePickerHelper.shared.dateFrom(day: 1, month: 1, year: 2050)
        //    guard let minDate = DatePickerHelper.shared.dateFrom(day: Date().day(), month: Date().month(), year: Date().year()) else {
        //      return
        //    }
        guard let maxDate = DatePickerHelper.shared.dateFrom(day: Date().day() + 15, month: Date().month() + 12, year: Date().year()) else {
          return
        }
        let beginDate = Date()
        let minDate = Date()
        let datePicker = DatePicker()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        //    dateFormatter.timeZone = .current
        // addvalues
        if SelectDateTF.text != ""{
          let date = SelectDateTF.text ?? ""
          let dateArr = date.components(separatedBy: "-")
          datePicker.setup(beginWith: beginDate ,min: minDate, max: maxDate, selected: { selected, date in
            if selected, let date2 = date {
              //        self.textFieldDidChange(textField: self.SelectDateTF)
              self.SelectDateTF.text = "\(dateFormatter.string(from: date2))"
            }
          })}else{
            datePicker.setup(beginWith: beginDate ,min: minDate, max: maxDate, selected: { selected, date in
              if selected, let date2 = date {
                //          self.textFieldDidChange(textField: self.SelectDateTF)
                self.SelectDateTF.text = "\(dateFormatter.string(from: date2))"
              }
            })
          }
        datePicker.show(in:self)
      }
      //
      @objc func openToDatePicker() {
        //    DatePickerHelper.shared.dateFrom(day: 1, month: 1, year: 2050)
        //    guard let minDate = DatePickerHelper.shared.dateFrom(day: Date().day(), month: Date().month(), year: Date().year()) else {
        //      return
        //    }
        guard let maxDate = DatePickerHelper.shared.dateFrom(day: Date().day() + 15, month: Date().month() + 12, year: Date().year()) else {
          return
        }
        let beginDate = Date()
        let minDate = Date()
        let datePicker = DatePicker()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        //    dateFormatter.timeZone = .current
        // addvalues
        if SelectToDateTF.text != ""{
          let date = SelectToDateTF.text ?? ""
          let dateArr = date.components(separatedBy: "-")
          datePicker.setup(beginWith: beginDate ,min: minDate, max: maxDate, selected: { selected, date in
            if selected, let date2 = date {
              //        self.textFieldDidChange(textField: self.SelectDateTF)
              self.SelectToDateTF.text = "\(dateFormatter.string(from: date2))"
            }
          })}else{
            datePicker.setup(beginWith: beginDate ,min: minDate, max: maxDate, selected: { selected, date in
              if selected, let date2 = date {
                //          self.textFieldDidChange(textField: self.SelectDateTF)
                self.SelectToDateTF.text = "\(dateFormatter.string(from: date2))"
              }
            })
          }
        datePicker.show(in:self)
      }
    //  func startTimeDiveChanged() {
    //
    //    let Timeis = Date()
    //
    //    let formatter = DateFormatter()
    //    formatter.dateFormat = "h:mm a"//"HH:mm"
    //    formatter.timeStyle = .short
    //    self.timePicker.datePickerMode = .time
    //    self.timePicker.preferredDatePickerStyle = .wheels
    //    SelectTimeTF.text = formatter.string(from: Timeis)
    //
    //    let date = formatter.date(from: "17:00")
    //
    //    timePicker.date = date as! Date
    //
    //  }
      @objc func datePickerChanged(datePicker : UIDatePicker){
        print("date = \(datePicker.date)")
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        self.timePicker.datePickerMode = .time
        //    self.timePicker.datePickerMode = .countDownTimer
        SelectTimeTF.text = formatter.string(from: datePicker.date)
        SelectedTime = datePicker.date
        endtime.removeAll()
        endtime.append(SelectTimeTF.text ?? "")
      }
      @objc func valueChanged(_ datePicker: UIDatePicker) {
        print("date = \(datePicker.date)")
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        self.EndtimePicker.datePickerMode = .time
        //    self.timePicker.datePickerMode = .countDownTimer
        EndTimeTF.text = formatter.string(from: datePicker.date)
        starttime.removeAll()
        starttime.append(EndTimeTF.text ?? "")
      }
      @objc func textvalueChanged() {
        desc.removeAll()
        desc.append(DiscriptionTF.text ?? "")
      }
      func creatTimePicker() {
        Formatter.time.defaultDate = Calendar.current.startOfDay(for: Date())
    //    let minimumDate = Formatter.time.date(from: "00:00") ?? Date()
        let maximumDate = Formatter.time.date(from: "24:00") ?? Date()
        self.timePicker.datePickerMode = UIDatePicker.Mode.time
        timePicker.date = SelectedTime
        timePicker.datePickerMode = .time
        //    timePicker.minuteInterval = 30
        timePicker.minimumDate = SelectedTime
        timePicker.maximumDate = maximumDate
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        formatter.timeStyle = .short
        //    SelectTimeTF.text = formatter.string(from: Timeis)
        self.SelectTimeTextFieldView.addSubview(timePicker)
      }
      func creatEndTimePicker() {
        Formatter.time.defaultDate = Calendar.current.startOfDay(for: Date())
    //    let minimumDate = Formatter.time.date(from: "00:00") ?? Date()
    //    let maximumDate = Formatter.time.date(from: "24:00") ?? Date()
        self.timePicker.datePickerMode = UIDatePicker.Mode.time
        EndtimePicker.date = SelectedTime
        EndtimePicker.datePickerMode = .time
        EndtimePicker.minuteInterval = 00
        EndtimePicker.minimumDate = SelectedTime
    //    EndtimePicker.maximumDate = maximumDate
        let Timeis = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        formatter.timeStyle = .short
        //    EndTimeTF.text = formatter.string(from: Timeis)
        self.EndTimeTextFieldView.addSubview(EndtimePicker)
      }
    }


extension DoctorSlotDetailsController{
  func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
    //    textField.reloadInputViews()
    if textField == SelectDateTF{
        DispatchQueue.main.async {
            self.view.endEditing(true)
            self.openDatePicker()
            self.view.endEditing(true)
        }
      
    }
    else if textField == SelectToDateTF{
        DispatchQueue.main.async {
            self.view.endEditing(true)
            self.openToDatePicker()
            self.view.endEditing(true)
        }
    }
    else if textField == SelectTimeTF
    {
      self.view.endEditing(true)
      //      timePicker.isHidden = false
      //      EndtimePicker.isHidden = true
      //      self.SelectTimeTF.inputView = timePicker
      creatTimePicker()
      self.view.endEditing(true)
    }
    else if textField == EndTimeTF
    {
      self.view.endEditing(true)
      //      EndtimePicker.isHidden = false
      //      self.SelectTimeTF.inputView = timePicker
      creatEndTimePicker()
      self.view.endEditing(true)
    }
    return true
  }
}

extension DoctorSlotDetailsController:UITextFieldDelegate{
  @objc
  func textFieldDidChange(textField: UITextField) {
    //    let valid = validate()
    //    if !valid.1 {
    //
    //    }
    //    else{
    //
    //    }
  }
  func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
    self.view.endEditing(true)
  }
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    if textField == SelectDateTF{
      SelectTimeTF.becomeFirstResponder()
    }
    else if textField == SelectTimeTF{
      EndTimeTF.becomeFirstResponder()
    }
    else if textField == EndTimeTF{
      self.view.endEditing(true)
    }
    return true
  }
}

extension DoctorSlotDetailsController
{
  func validate() -> (String?, Bool) {
    let SelectDate = SelectDateTF.text?.trimmingCharacters(in: .whitespacesAndNewlines)
    let SelectToDate = SelectToDateTF.text?.trimmingCharacters(in: .whitespacesAndNewlines)
    let SelectStartTime = SelectTimeTF.text?.trimmingCharacters(in: .whitespacesAndNewlines)
    let SelectEndTime = EndTimeTF.text?.trimmingCharacters(in: .whitespacesAndNewlines)
    let DiscriptionTF1 = DiscriptionTF.text?.trimmingCharacters(in: .whitespacesAndNewlines)
    //    if name!.count <= 2 {
    //      return("Name is required.", false)
    //    }
    if SelectDate?.count == 0 {
      return("Date From Field is required.", false)
    }
    if SelectToDate?.count == 0 {
      return("Date To Field is required.", false)
    }
    if SelectStartTime?.count == 0 {
      return("Start Time Field is required.", false)
    }
    if SelectEndTime?.count == 0 {
      return("End Time Field is required.", false)
    }
    if DiscriptionTF1?.count == 0 {
      return("Description Field is required.", false)
    }
    //    if !Helper.validatePassword(passwordTF.text!) {
    //      return("Please enter correct Password", false)
    //    }
    return(nil,true)
  }
}

extension DoctorSlotDetailsController : UITableViewDelegate, UITableViewDataSource
{
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if tableView == AvailableSlotTV
    {
      slotCount = getAvailableSlotList.data?.count ?? 0
      if slotCount > 0
        {
      ResultCountLbl.text = String(slotCount)
      }
        else
        {
            slotCount = 0
            ResultCountLbl.text = String(slotCount)
        }
      return getAvailableSlotList.data?.count ?? 0
    }
    else
    {
      bookslotCount = getbookSlotList.data?.count ?? 0
        if bookslotCount > 0
        {
      bookResultCountLbl.text = String(bookslotCount)
        }
        else
        {
            bookslotCount = 0
            bookResultCountLbl.text = String(bookslotCount)
        }
      return getbookSlotList.data?.count ?? 0
    }
  }
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    if tableView == AvailableSlotTV
    {
      let cell = AvailableSlotTV.dequeueReusableCell(withIdentifier: AvailableSlotTVCell.cellidentifier, for: indexPath) as! AvailableSlotTVCell
      cell.Slotnumber.text = ("Slot # \(indexPath.row + 1)")
      cell.SlotStartTime.text = ("Start time: \(getAvailableSlotList.data?[indexPath.row].end_time ?? "")")
      cell.SlotEndTime.text = ("End time: \(getAvailableSlotList.data?[indexPath.row].start_time ?? "")")
      cell.appointmentdatelbl.text = getAvailableSlotList.data?[indexPath.row].date
      cell.docavailibiltyBtn.setTitle(getAvailableSlotList.data?[indexPath.row].status, for: .normal)
      cell.descTF.text = getAvailableSlotList.data?[indexPath.row].description
      cell.deleteBtn.tag = indexPath.row
      cell.deleteBtn.addTarget(self, action: #selector(deleteslot), for: .touchUpInside)
      return cell
    }
    else if tableView == BookedSlotTV
    {
      let cell = BookedSlotTV.dequeueReusableCell(withIdentifier: AvailableSlotTVCell.cellidentifier, for: indexPath) as! AvailableSlotTVCell
      cell.Slotnumber.text = ("Slot # \(indexPath.row + 1)")
      cell.SlotStartTime.text = ("Start time: \(getbookSlotList.data?[indexPath.row].end_time ?? "")")
      cell.SlotEndTime.text = ("End time: \(getbookSlotList.data?[indexPath.row].start_time ?? "")")
      cell.appointmentdatelbl.text = getbookSlotList.data?[indexPath.row].date
      cell.docavailibiltyBtn.setTitle(getbookSlotList.data?[indexPath.row].status, for: .normal)
      cell.descTF.text = getbookSlotList.data?[indexPath.row].description
      cell.deleteBtn.tag = indexPath.row
      cell.deleteBtn.addTarget(self, action: #selector(deletesbooklot), for: .touchUpInside)
      return cell
    }
    else
    {
      let cell = BookedSlotTV.dequeueReusableCell(withIdentifier: AvailableSlotTVCell.cellidentifier, for: indexPath) as! AvailableSlotTVCell
      print("Nothing")
      return cell
    }
  }
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    if tableView == AvailableSlotTV
    {
      deleteid = getAvailableSlotList.data?[indexPath.row].id ?? 0
    }
    else if tableView == BookedSlotTV
    {
      deleteid = getbookSlotList.data?[indexPath.row].id ?? 0
    }
  }
  @objc func deletesbooklot(_ sender : UIButton)
  {
    // Create the alert controller
    let alertController = UIAlertController(title: "Alert", message: "Are You Sure You Want To Delete The Slot?", preferredStyle: .alert)
      // Create the actions
    let okAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default) {
        UIAlertAction in
      self.deleteid = self.getbookSlotList.data?[sender.tag].id ?? 0
      self.deleteBookSlot()
//      if self.deleteid == 0
//      {
//      alertWithMsg(vc: self, msg: "Pick The Slot First", title: "Alert!")
//      }
//      else
//      {
//      }
      }
    let noAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default) {
        UIAlertAction in
    }
      // Add the actions
      alertController.addAction(noAction)
      alertController.addAction(okAction)
      // Present the controller
    self.present(alertController, animated: true, completion: nil)
  }
  func deleteBookSlot()
  {
    delbookManager.deleteslot(id: deleteid) { docdata,msg, hasError in
      if hasError{
        //   RSLoadingView.hide(from: self.view)
        alertWithMsg(vc: self, msg: msg, title: "Alert!")
      }else{
        if docdata != nil
        {
//          alertWithMsg(vc: self, msg: "Slot Deleted Successfully", title: "Alert!")
          self.getdoctorbookslotlist()
//          self.BookedSlotTV.reloadData()
        }
        else
        {
          //        RSLoadingView.hide(from: self.view)
          alertWithMsg(vc: self, msg: msg, title: "Alert")
        }
      }
    }
  }
    
  @objc func deleteslot(_ sender : UIButton)
  {
    // Create the alert controller
    let alertController = UIAlertController(title: "Alert", message: "Are You Sure You Want To Delete The Slot?", preferredStyle: .alert)
      // Create the actions
    let okAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default) {
        UIAlertAction in
      self.deleteid = self.getAvailableSlotList.data?[sender.tag].id ?? 0
//      if self.deleteid == 0
//      {
//      alertWithMsg(vc: self, msg: "Pick The Slot First", title: "Alert!")
//      }
//      else
//      {
      self.deleteAvailableSlot()
//      }
      }
    let noAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default) {
        UIAlertAction in
    }
      // Add the actions
      alertController.addAction(noAction)
      alertController.addAction(okAction)
      // Present the controller
    self.present(alertController, animated: true, completion: nil)
  }
  func deleteAvailableSlot()
  {
    delManager.deleteslot(id: deleteid) { docdata,msg, hasError in
      if hasError{
        //   RSLoadingView.hide(from: self.view)
        alertWithMsg(vc: self, msg: msg, title: "Alert!")
      }else{
        if docdata != nil
        {
//          alertWithMsg(vc: self, msg: "Slot Deleted Successfully", title: "Alert!")
          self.getdoctoravailslotlist()
//           self.AvailableSlotTV.reloadData()
        }
        else
        {
          //        RSLoadingView.hide(from: self.view)
          alertWithMsg(vc: self, msg: msg, title: "Alert")
        }
      }
    }
  }
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    if tableView == AvailableSlotTV
    {
      return 125 * appConstant.heightRatio
    }
    else
    {
      return 125 * appConstant.heightRatio
    }
  }
}

extension Formatter {
  static let time: DateFormatter = {
    let formatter = DateFormatter()
    formatter.locale = .init(identifier: "em_US_POSIX")
    formatter.dateFormat = "HH:mm"
    return formatter
  }()
}
