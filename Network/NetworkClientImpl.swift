//import Alamofire
//import Foundation
//import Promises
//import UIKit
//
//// MARK: - Constants
//
//private enum Constants {
//    static let maxImageSize: Double = 2.5 * 1024 * 1024
//}
//
//// MARK: - NetworkClientImpl
//
//final class NetworkClientImpl: NetworkClient {
//    private var baseURL: String {
//        baseURLProvider.baseURL
//    }
//
//    private let session: Session
//    private let baseURLProvider: BaseURLProvider
//    private let signatureFactory: SignatureFactory
//
//    private let errorRequestValidator = ErrorURLRequestValidator()
//
//    init(session: Session, baseURLProvider: BaseURLProvider, signatureFactory: SignatureFactory) {
//        self.session = session
//        self.baseURLProvider = baseURLProvider
//        self.signatureFactory = signatureFactory
//    }
//
//    func request<Response: Decodable>(
//        baseURL: String?,
//        _ relativePath: String,
//        method: HTTPMethod,
//        parameters: some Encodable,
//        headers: HTTPHeaders?,
//        shouldAddSignature: Bool
//    ) -> Promise<Response> {
//        var request = session.request(
//            (baseURL ?? self.baseURL) + relativePath,
//            method: method,
//            parameters: parameters,
//            encoder: ParameterEncoderFactory().makeParameterEncoder(for: method),
//            headers: headers
//        )
//
//        if
//            shouldAddSignature,
//            let signature = signatureFactory.makeSignature(from: request)
//        {
//            request = session.request(
//                (baseURL ?? self.baseURL) + relativePath,
//                method: method,
//                parameters: parameters,
//                encoder: ParameterEncoderFactory().makeParameterEncoder(for: method),
//                headers: HTTPHeaders(
//                    (headers ?? []) + [HTTPHeader(name: "Signature", value: signature)]
//                )
//            )
//        }
//
//        let validation = errorRequestValidator.validate(request:response:data:)
//
//        return request
//            .validate(validation)
//            .toPromise()
//    }
//
//    func upload<Response: Decodable>(_ relativePath: String, data: [String: Any]) -> Promise<Response> {
//        let multipartFormData: (MultipartFormData) -> Void = { formData in
//            data.forEach { key, value in
//                switch value {
//                case let value as Int:
//                    guard let data = "\(value)".data(using: .utf8) else {
//                        return
//                    }
//
//                    formData.append(data, withName: key)
//                case let value as String:
//                    guard let data = value.data(using: .utf8) else {
//                        return
//                    }
//
//                    formData.append(data, withName: key)
//                case let value as UIImage:
//                    guard
//                        let size = value.jpegData(compressionQuality: 1).flatMap({ Double($0.count) }),
//                        let data = value.jpegData(
//                            compressionQuality: min(1, Constants.maxImageSize / size)
//                        )
//                    else {
//                        return
//                    }
//
//                    formData.append(
//                        data,
//                        withName: key,
//                        fileName: "\(key).jpeg",
//                        mimeType: "image/jpeg"
//                    )
//                default:
//                    break
//                }
//            }
//        }
//        let validation = errorRequestValidator.validate(request:response:data:)
//
//        return session
//            .upload(multipartFormData: multipartFormData, to: baseURL + relativePath)
//            .validate(validation)
//            .toPromise()
//    }
//}
