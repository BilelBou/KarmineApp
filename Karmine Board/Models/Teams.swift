import Foundation

struct KarmineTeam: Codable {
    let acronym: String
    let currentVideogame: CurrentVideogame
    let id: Int
    let imageURL: String
    let location: Location
    let modifiedAt: String
    let name: String
    let players: [Player]
    let slug: String

    enum CodingKeys: String, CodingKey {
        case acronym
        case currentVideogame = "current_videogame"
        case id
        case imageURL = "image_url"
        case location
        case modifiedAt = "modified_at"
        case name, players, slug
    }
}

// MARK: - CurrentVideogame
struct CurrentVideogame: Codable {
    let id: Int
    let name, slug: String
}

enum Location: String, Codable {
    case be = "BE"
    case fr = "FR"
    case ma = "MA"
    case pl = "PL"
}

// MARK: - Player
struct Player: Codable {
    let age: Int?
    let birthday: String?
    let firstName: String
    let id: Int
    let imageURL: String?
    let lastName: String
    let modifiedAt: String
    let name: String
    let nationality: Location
    let role: String?
    let slug: String

    enum CodingKeys: String, CodingKey {
        case age, birthday
        case firstName = "first_name"
        case id
        case imageURL = "image_url"
        case lastName = "last_name"
        case modifiedAt = "modified_at"
        case name, nationality, role, slug
    }
}

typealias KarmineTeams = [KarmineTeam]
