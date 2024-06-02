//import Alamofire
//import Foundation
//import Promises
//
//// MARK: - DataRequest + toPromise
//
//extension DataRequest {
//    func toPromise<Response: Decodable>() -> Promise<Response> {
//        Promise { fulfill, reject in
//            self.responseDecodable(
//                of: Response.self,
//                queue: .global(qos: .userInitiated),
//                decoder: JSONDecoder.default
//            ) { dataResponse in
//                switch dataResponse.result {
//                case let .success(value):
//                    fulfill(value)
//                case let .failure(error):
//                    if let extendedError = error.asExtendedError {
//                        reject(extendedError)
//                    } else if let networkError = error.asNetworkError {
//                        reject(networkError)
//                    } else {
//                        let code = NetworkErrorCapturer().capture(error: error, dataResponse: dataResponse)
//                        let networkError = NetworkError(code: code)
//
//                        reject(networkError)
//                    }
//                }
//            }
//        }
//    }
//}
//
//// MARK: - Error + NetworkError
//
//extension Error {
//    fileprivate var asExtendedError: Error? {
//        unwrapError(from: self, ofType: ExtendedError.self)
//    }
//
//    fileprivate var asNetworkError: Error? {
//        unwrapError(from: self, ofType: NetworkError.self)
//    }
//
//    private func unwrapError<T: Error>(from error: Error, ofType type: T.Type) -> Error? {
//        if let targetError = error as? T {
//            return targetError
//        }
//
//        guard let afError = error.asAFError else {
//            return nil
//        }
//
//        switch afError {
//        case let .requestRetryFailed(retryError, _):
//            return unwrapError(from: retryError, ofType: type)
//        case let .sessionTaskFailed(error):
//            if let error = error as? URLError {
//                return NetworkError(message: error.localizedDescription)
//            } else {
//                fallthrough
//            }
//        default:
//            guard let underlyingError = afError.underlyingError else {
//                return nil
//            }
//
//            return unwrapError(from: underlyingError, ofType: type)
//        }
//    }
//}
