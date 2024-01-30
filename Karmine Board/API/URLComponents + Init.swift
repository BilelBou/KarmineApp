import Foundation

public extension URLComponents {

    init(scheme: String  = "https",
         host: String = "api.pandascore.co",
         path: String,
         queryItems: [URLQueryItem]? = nil) {
        var components = URLComponents()
        components.scheme = scheme
        components.host = host
        components.path = path
        components.queryItems = queryItems
        self = components
    }
}
