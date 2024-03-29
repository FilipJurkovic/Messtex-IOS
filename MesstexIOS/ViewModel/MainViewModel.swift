//
//  MainViewModel.swift
//  MesstexIOS
//
//  Created by Filip Jurković on 27.07.2021..
//

import AVFoundation
import LanguageManagerSwiftUI

class MainViewModel: ObservableObject {

    // API DATA
    @Published var co2Level: CarbonDataModel
    @Published var faq: Faq
    @Published var userData: UtilizationResponseModel
    @Published var postModelData: PostModelRecord
    @Published var contactFormData: ContactFormData
    @Published var verificationError: ErrorModel

    @Published var faqFlagIndex: [Bool]
    @Published var readingStepsProgress: [Bool]

    // RANDOM PARAMS
    @Published var isProgressBarActive: Bool
    @Published var currentReadingView : ReadingFlowEnum?
    @Published var previousReadingView : ReadingFlowEnum?
    @Published var currentMeterIndex: Int
    @Published var isTorchOn: Bool
    @Published var isInfoSheetOpen: Bool
    @Published var dismissReadingFlow: Bool
    @Published var isReadingFinished : Bool
    @Published var isLanguagePickerShowing : Bool
    @Published var language : String
    @Published var counterImage : Data?
    @Published var showAboutPage : Bool
    
    
    
    //VIEWMODEL INITIALIZATION
    init() {
        self.co2Level = CarbonDataModel(co2Level: 0.0)
        self.faq = Faq(faqs: [])
        self.userData = UtilizationResponseModel(firstName: "", lastName: "", email: "", phone: "", street: "", houseNumber: "", postcode: "", city: "", floor: "", readingReason: "", meters: [], askForSubscribeNewsletter: false)
        self.postModelData = PostModelRecord(verificationCode: "", language: "en",meterReadings: [], firstName: "", secondName: "", email: "", phone: "", sendCopy: false, getMeterReadingLetterByEmail: false, subscribeNewsletter: false)
        self.contactFormData = ContactFormData(name: "", email: "", subject: "", message: "")
        self.verificationError = ErrorModel(message: "")

        self.faqFlagIndex = []
        self.readingStepsProgress = []

        self.isProgressBarActive = false
        self.isTorchOn = false
        self.isInfoSheetOpen = false
        self.currentReadingView = .codeReadingView
        self.currentMeterIndex = 0
        self.dismissReadingFlow = false
        self.isReadingFinished = false
        self.isLanguagePickerShowing = false
        self.language = "English"
        self.showAboutPage = false
        
    }

    func toggleFaqFlagIndex(index: Int) {
        self.faqFlagIndex[index] = !self.faqFlagIndex[index]
    }

    func removePoint(value: String) -> String {
        var mutatedValue = value
        if let idx = mutatedValue.firstIndex(of: ".") {
            let pos = mutatedValue.distance(from: mutatedValue.startIndex, to: idx)
            let deltaLength = (mutatedValue.count-1) - pos
            if deltaLength == 1 {
                mutatedValue.append("0")
            }
        } else {
            mutatedValue.append("00")
        }
        return mutatedValue.replacingOccurrences(of: ".", with: "")
    }

    func addComma(value: String) -> String {
        let commaPosition: String.Index = value.index(value.startIndex, offsetBy: value.count-2)

        return "\(value.substring(to: commaPosition)).\(value.substring(from: commaPosition))"
    }

    func isContactFormValid() -> Bool {
        let isNameValid: Bool = self.contactFormData.name != ""
        let isEmailValid: Bool = self.contactFormData.email != ""
        let isMessageValid: Bool = self.contactFormData.message != ""

        return isNameValid && isEmailValid && isMessageValid
    }

    func areContactDetailsValid() -> Bool {
        let isFirstNameValid: Bool = self.userData.firstName != ""
        let isEmailValid: Bool = self.userData.email != ""
        let isLastNameValid: Bool = self.userData.lastName != ""
        let isPhoneValid: Bool = self.userData.phone != ""
        return isFirstNameValid &&  isLastNameValid && isEmailValid && isPhoneValid
    }
    
    
    func getMeterTypeIcon(meterType: String) -> String{
        switch meterType{
            case "WMZ":
                return "heat_meter"
                
            case "WWZ":
                return "water_meter"
             
            case "KMZ":
                return "heat_meter"
                    
            case "KWZ":
                return "water_meter"
                
            case "RWZ":
                return "heat_alocator"
              
            default:
                return "heat_meter"
        }
    }

    func getInfoViewIndex(meterType: String) -> Int {
        switch meterType {
        case "WMZ":
            return 1

        case "WWZ":
            return 0

        case "KMZ":
            return 1

        case "KWZ":
            return 0

        case "RWZ":
            return 2

        default:
            return 1
        }

    }
    
    func getLanguageCode() -> String{
        switch self.language {
        case "English":
            return "en"
        case "Deutsch":
            return "de"
        default:
            return ""
        }
    }
    

    
    func toggleTorch() {
        guard let device = AVCaptureDevice.default(for: .video) else { return }

        if device.hasTorch {
            do {
                try device.lockForConfiguration()

                if !self.isTorchOn == true {
                    device.torchMode = .on
                } else {
                    device.torchMode = .off
                }

                device.unlockForConfiguration()
            } catch {
                print("Torch could not be used")
            }
        } else {
            print("Torch is not available")
        }
    }

    func populatePostModelData(pin: String) {
        self.postModelData.firstName = self.userData.firstName
        self.postModelData.secondName = self.userData.lastName
        self.postModelData.email = self.userData.email
        self.postModelData.phone = self.userData.phone
        self.postModelData.verificationCode = pin
    }

    func formatNumber(number: Int) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .none

        return formatter.string(from: NSNumber(value: number)) ?? "0"
    }

    // TODO: consider deleting - unused
    func checkReadingStepStatus() -> Bool {
        !readingStepsProgress.contains(false)
    }
    
    //API REQUESTS
    let url = URL(string: "https://api.ninoxdb.de/v1/teams/yCZezLbXfFAiwR6r3/databases/bp5lebrgr570/query")
    
    
    func getCO2Levels(){
        let jsonBody = try? JSONEncoder().encode(PostModel(query: "getCO2Level()"))
        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        request.httpBody = jsonBody
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("Bearer eecf7fd0-cee9-11eb-b752-fde919688281", forHTTPHeaderField: "Authorization")

        DispatchQueue.main.async {
            URLSession.shared.dataTask(with: request) { data, _, _ in
                guard let data = data else { return }
                let co2_value = try! JSONDecoder().decode(Double.self, from: data)
                self.co2Level = CarbonDataModel(co2Level: co2_value)
                print(data)
            }.resume()
        }
    }
    
    func getFAQs(){
        let jsonBody = try? JSONEncoder().encode(PostModel(query: "getFAQs(\"{\"\"language\"\":\"\"\(getLanguageCode())\"\"}\")"))
        
        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        request.httpBody = jsonBody
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("Bearer eecf7fd0-cee9-11eb-b752-fde919688281", forHTTPHeaderField: "Authorization")
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            URLSession.shared.dataTask(with: request){ (data, response, error) in
            guard let data = data else {return}
                
                do{
                    let response = try JSONDecoder().decode(Faq.self, from: data)
                    self.faq = response
                    
                    var newBoolArray: [Bool] = []
                    for _ in 0...self.faq.faqs.count-1{
                        newBoolArray.append(false)
                    }
                    self.faqFlagIndex = newBoolArray
                }catch{
                    print(error)
                }
            
            
        }.resume()
            
        }
    }
    
    func getUtilizationUnitData(pin : String){
        let body = try? JSONEncoder().encode(UtilizationModel(verificationCode: pin, language: getLanguageCode()))
        let json: String = String(data: body!, encoding: String.Encoding.utf8) ?? " "
        let jsonBody = try? JSONEncoder().encode(PostModel(query: "getUtilizationUnitData(\"\(json.replacingOccurrences(of: "\"", with: "\"\""))\")"))

        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        request.httpBody = jsonBody
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("Bearer eecf7fd0-cee9-11eb-b752-fde919688281", forHTTPHeaderField: "Authorization")

        self.isProgressBarActive = true

        DispatchQueue.main.async {
            URLSession.shared.dataTask(with: request) { data, _, error in
                guard let data = data else { return }

                var newBoolArray: [Bool] = []
                for _ in 0...self.userData.meters.count{
                    newBoolArray.append(false)
                }
                
                for meter in self.userData.meters{
                    self.postModelData.meterReadings.append(MeterReadingData(counterNumber: meter.counterNumber, counterType: meter.counterType, counterValue: "", userMessage: ""))
                }
                self.populatePostModelData(pin: pin)
                
                self.readingStepsProgress = newBoolArray
                self.readingStepsProgress[newBoolArray.endIndex-1] = self.areContactDetailsValid()
                self.isProgressBarActive = false
                if error == nil{
                    self.previousReadingView = ReadingFlowEnum.codeReadingView
                    self.currentReadingView = ReadingFlowEnum.readingStepsView
                }
            } catch{
                print(error)
                self.verificationError = try! JSONDecoder().decode(ErrorModel.self, from: data)
                self.isProgressBarActive = false
            }

            }
            .resume()
        }
    }

    func takeMeterReadings() {
        let body = try? JSONEncoder().encode(postModelData)
        let json = String(data: body!, encoding: String.Encoding.utf8) ?? " "
        let jsonBody = try? JSONEncoder().encode(PostModel(query: "takeMeterReadings(\"\(json.replacingOccurrences(of: "\"", with: "\"\""))\")"))

        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        request.httpBody = jsonBody
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("Bearer eecf7fd0-cee9-11eb-b752-fde919688281", forHTTPHeaderField: "Authorization")

        self.isProgressBarActive = true

        DispatchQueue.main.async {
            URLSession.shared.dataTask(with: request) { data, _, error in
                guard let data = data else { return }
                self.co2Level = try! JSONDecoder().decode(CarbonDataModel.self, from: data)

                self.isProgressBarActive = false
                if error == nil {
                    self.currentReadingView = ReadingFlowEnum.successView
                }

            }.resume()
        }
    }

    func takeContactForm() {
        let body = try? JSONEncoder().encode(contactFormData)
        let json = String(data: body!, encoding: String.Encoding.utf8) ?? " "
        let jsonBody = try? JSONEncoder().encode(PostModel(query: "takeContactForm(\"\(json.replacingOccurrences(of: "\"", with: "\"\""))\")"))

        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        request.httpBody = jsonBody
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("Bearer eecf7fd0-cee9-11eb-b752-fde919688281", forHTTPHeaderField: "Authorization")
        
        self.isProgressBarActive = true
        
        DispatchQueue.main.async {
        URLSession.shared.dataTask(with: request){ (data, response, error) in
            guard let data = data else {return}
            self.counterImage = data
            
        }.resume()
        }
    }
    
    func getCounterImage(index : Int){
        if self.userData.meters[index].counterDescriptionImage == "" {
            self.counterImage = nil
        }else   {
            var request = URLRequest(url: URL(string: self.userData.meters[index].counterDescriptionImage)!)
            request.httpMethod = "GET"
            //request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.setValue("Bearer eecf7fd0-cee9-11eb-b752-fde919688281", forHTTPHeaderField: "Authorization")
            
            DispatchQueue.main.async {
                URLSession.shared.dataTask(with: request){ (data, response, error) in
                    guard let data = data else {return}
                    self.counterImage = data
                    
                }.resume()
            }
        }
    }

}
