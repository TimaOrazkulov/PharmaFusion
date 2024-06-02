import Alamofire
import Promises

// MARK: - NetworkClient

public protocol NetworkClient: AnyObject {
    func request<Parameters: Encodable, Response: Decodable>(
        baseURL: String?,
        _ relativePath: String,
        method: HTTPMethod,
        parameters: Parameters,
        headers: HTTPHeaders?,
        shouldAddSignature: Bool
    ) -> Promise<Response>

    func upload<Response: Decodable>(
        _ relativePath: String,
        data: [String: Any]
    ) -> Promise<Response>
}

// MARK: - Convenience Methods

extension NetworkClient {
    public func get<Response: Decodable>(
        baseURL: String? = nil,
        _ relativePath: String,
        parameters: some Encodable,
        headers: HTTPHeaders? = nil
    ) -> Promise<Response> {
        request(
            baseURL: baseURL,
            relativePath,
            method: .get,
            parameters: parameters,
            headers: headers,
            shouldAddSignature: false
        )
    }

    public func post<Response: Decodable>(
        baseURL: String? = nil,
        _ relativePath: String,
        parameters: some Encodable,
        headers: HTTPHeaders? = nil,
        shouldAddSignature: Bool = false
    ) -> Promise<Response> {
        request(
            baseURL: baseURL,
            relativePath,
            method: .post,
            parameters: parameters,
            headers: headers,
            shouldAddSignature: shouldAddSignature
        )
    }

    public func put<Response: Decodable>(
        baseURL: String? = nil,
        _ relativePath: String,
        parameters: some Encodable,
        headers: HTTPHeaders? = nil
    ) -> Promise<Response> {
        request(
            baseURL: baseURL,
            relativePath,
            method: .put,
            parameters: parameters,
            headers: headers,
            shouldAddSignature: false
        )
    }

    public func patch<Response: Decodable>(
        baseURL: String? = nil,
        _ relativePath: String,
        parameters: some Encodable,
        headers: HTTPHeaders? = nil
    ) -> Promise<Response> {
        request(
            baseURL: baseURL,
            relativePath,
            method: .patch,
            parameters: parameters,
            headers: headers,
            shouldAddSignature: false
        )
    }

    public func delete<Response: Decodable>(
        baseURL: String? = nil,
        _ relativePath: String,
        parameters: some Encodable,
        headers: HTTPHeaders? = nil
    ) -> Promise<Response> {
        request(
            baseURL: baseURL,
            relativePath,
            method: .delete,
            parameters: parameters,
            headers: headers,
            shouldAddSignature: false
        )
    }
}

// MARK: - Convenience Methods With Empty Parameters

extension NetworkClient {
    public func get<Response: Decodable>(
        baseURL: String? = nil,
        _ relativePath: String,
        headers: HTTPHeaders? = nil
    ) -> Promise<Response> {
        request(
            baseURL: baseURL,
            relativePath,
            method: .get,
            parameters: Empty.value,
            headers: headers,
            shouldAddSignature: false
        )
    }

    public func post<Response: Decodable>(
        baseURL: String? = nil,
        _ relativePath: String,
        headers: HTTPHeaders? = nil,
        shouldAddSignature: Bool = false
    ) -> Promise<Response> {
        request(
            baseURL: baseURL,
            relativePath,
            method: .post,
            parameters: Empty.value,
            headers: headers,
            shouldAddSignature: shouldAddSignature
        )
    }

    public func delete<Response: Decodable>(
        baseURL: String? = nil,
        _ relativePath: String,
        headers: HTTPHeaders? = nil
    ) -> Promise<Response> {
        request(
            baseURL: baseURL,
            relativePath,
            method: .delete,
            parameters: Empty.value,
            headers: headers,
            shouldAddSignature: false
        )
    }
}
