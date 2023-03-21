//
//  NetworkService.swift
//  ShopTestApp
//
//  Created by Eugene Kudritsky on 16.03.23.
//

import Foundation

protocol NetworkServiceProtocol {
  func getLatest(completion: @escaping (Result<LatestModelArray, Error>) -> Void)
  func getFlashSales(completion: @escaping (Result<FlashSaleModel, Error>) -> Void)
  func getDetailsInfo(completion: @escaping (Result<FlashDetailsModel, Error>) -> Void)
}

final class NetworkService: NetworkServiceProtocol {

  enum URLs {
    static let latestURL = "https://run.mocky.io/v3/cc0071a1-f06e-48fa-9e90-b1c2a61eaca7"
    static let flashSaleURL = "https://run.mocky.io/v3/a9ceeb6e-416d-4352-bde6-2203416576ac"
    static let getDetailsURL = "https://run.mocky.io/v3/f7f99d04-4971-45d5-92e0-70333383c239"
  }

  //MARK: - Get Latest

  func getLatest(completion: @escaping (Result<LatestModelArray, Error>) -> Void) {
    self.createRequest(with: URL(string: URLs.latestURL), type: .GET) { request in
      let task = URLSession.shared.dataTask(with: request) { data, _, error in
        guard let data = data, error == nil else { return }
        do {
          let result = try JSONDecoder().decode(LatestModelArray.self, from: data)
          completion(.success(result))
        }
        catch {
          completion(.failure(error))
        }
      }
      task.resume()
    }
  }


  //MARK: - Get flash sales

  func getFlashSales(completion: @escaping (Result<FlashSaleModel, Error>) -> Void) {
    self.createRequest(with: URL(string: URLs.flashSaleURL), type: .GET) { request in
      let task = URLSession.shared.dataTask(with: request) { data, _, error in
        guard let data = data, error == nil else { return }
        do {
          let result = try JSONDecoder().decode(FlashSaleModel.self, from: data)
          completion(.success(result))
        }
        catch {
          completion(.failure(error))
        }
      }
      task.resume()
    }
  }

  //MARK: - Get details info

  func getDetailsInfo(completion: @escaping (Result<FlashDetailsModel, Error>) -> Void) {
    self.createRequest(with: URL(string: URLs.getDetailsURL), type: .GET) { request in
      let task = URLSession.shared.dataTask(with: request) { data, _, error in
        guard let data = data, error == nil else { return }
        do {
          let result = try JSONDecoder().decode(FlashDetailsModel.self, from: data)
          completion(.success(result))
        }
        catch {
          completion(.failure(error))
        }
      }
      task.resume()
    }
  }

}

//MARK: - Create Request
extension NetworkService {
  private func createRequest(with url: URL?, type: HTTPMethod, completion: @escaping (URLRequest) -> Void) {
          guard let apiURL = url else { return }
          var request = URLRequest(url: apiURL)
          request.httpMethod = type.rawValue
          request.timeoutInterval = 30
          completion(request)
      }
}
