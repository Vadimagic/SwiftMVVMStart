import Foundation
import Alamofire

class NetworkService {
    static let shared = NetworkService()
    
    private let weatherDataUrlString = "http://api.openweathermap.org/data/2.5/forecast?id=578072&appid=15a151ecc0fabd24775f7d8b0236fcdc"
    
    private init() {}
    
    func fetchWeatherJSONData(completion: @escaping (Data?) -> Void) {
        AF.request(weatherDataUrlString).validate().responseJSON { (response) in
            switch response.result {
            case .success(_):
                completion(response.data)
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
                completion(nil)
            }
        }
    }

}
