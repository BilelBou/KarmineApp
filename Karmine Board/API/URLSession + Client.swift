import Foundation
import Combine

public extension URLSession {

    func fetch<Response: Decodable>(for request: URLRequest,
                                    with type: Response.Type) -> AnyPublisher<Response, Error> {
        var cancellable = Set<AnyCancellable>()


        dataTaskPublisher(for: request)
            .sink { completion in
                print(completion)
            } receiveValue: { todo in
                print(todo)
            }
            .store(in: &cancellable)

       return dataTaskPublisher(for: request)
            .map(\.data)
            .decode(type: type, decoder: JSONDecoder())
            .eraseToAnyPublisher()

    }
}
