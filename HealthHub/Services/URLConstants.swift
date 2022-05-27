//
//  URLConstants.swift
//  HealthHub
//
//  Created by OBS on 29/12/2021.
//

import Foundation

class URLConstants{
    
//http://certiflyapi.massolabs.com/doctoruk/public/api/
//http://certiflyapi.massolabs.com/doctorukNew/public/api/
    
  static var BASE_URL = "https://massolabs.com/doctorapp/public/api/"
    
  //"https://www.obstechnologia.com/doctoruk/public/api/"
  //"https://certiflyapi.massolabs.com/Doctor.uk/public/api/"
  //"https://certiflyapi.massolabs.com/HealthHub/public/api/"
  //"http://192.168.18.106:8000/api/"
  static var signup = BASE_URL + "signup"
  static var signin = BASE_URL + "signin"
  static var doc_cat = BASE_URL + "category"
  static var doc_sub_cat = BASE_URL + "category_subcat/"
  static var sub_cat_doc = BASE_URL + "subcat_doctor/"
  static var join_room = BASE_URL + "access_token"
  static var doc_specility = BASE_URL + "doctor_speciality/"
  static var get_symptops = BASE_URL + "symptoms"
  static var add_symptops = BASE_URL + "add_symptoms"
  static var forgot_password = BASE_URL + "forgotpassword"
  static var social_login = BASE_URL + "social_login"
  static var check_available_docs = BASE_URL + "check_availabe_doctor"
  static var check_available_dates = BASE_URL + "available_dates"
  static var edit_profile = BASE_URL + "editproflie"
  static var user_profile = BASE_URL + "userprofile"
  static var get_illness = BASE_URL + "illness"
  static var get_appointment = BASE_URL + "pateint_appoinment"
  static var get_past_appointment = BASE_URL + "pateint_appoinment_past"
  static var patient_review = BASE_URL + "review"
    
  static var sendNotification = BASE_URL + "send_notification"
  static var chatList = "https://massolabs.com/doctorapp/public//public/chatify/api/getContacts"
  static var getChat = "https://massolabs.com/doctorapp/public/public/chatify/api/fetchMessages"
  static var sendMsg = "https://massolabs.com/doctorapp/public/chatify/api/sendMessage"
  //For Doctor Api URL'S
  static var doctor_profile = BASE_URL + "doctor_profile"
  static var doctor_edit_profile = BASE_URL + "doctoreditproflie"
  static var doctor_add_slot = BASE_URL + "add_slot"
  static var doctor_available_slot = BASE_URL + "available_slot"
  static var doctor_booked_slot = BASE_URL + "booked_slot"
  static var doctor_reviews = BASE_URL + "reviews"
  static var doctor_delete_slot = BASE_URL + "delete_slot/"
  static var doctor_appoinment = BASE_URL + "appoinment"
  static var doctor_past_appoinment = BASE_URL + "appoinment_past"
  static var doctor_own_specitly = BASE_URL + "doctor_own_speciality"
  static var all_Specialty_Sub = BASE_URL + "show_all_subcat"
  static var add_Specialty = BASE_URL + "add_speciality"
  static var home = BASE_URL + "doctor_home"
  static var changeStatus = BASE_URL + "change_status_appointment"
  static var user_logout = BASE_URL + "logout"
    
  static var get_notification = BASE_URL + "notification"
    
    
  //For image and file base extention
  static var BASE_File = "https://massolabs.com/doctorapp/public/"
    
  static var make_seen = "https://massolabs.com/doctorapp/public/public/chatify/api/makeSeen"
  static var update_contacts = "https://massolabs.com/doctorapp/public/chatify/api/updateContacts"

}
