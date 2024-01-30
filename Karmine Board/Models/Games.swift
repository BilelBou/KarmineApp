import Foundation

typealias Matchs = [Match]

struct Match: Codable, Identifiable {
    let id: Int
    let beginAt: String?
    let detailedStats, draw: Bool
    let endAt: String?
    let forfeit: Bool
    let games: [Game]
    let league: League
    let leagueID: Int
    let live: Live
    let matchType: String
    let modifiedAt: String
    let name: String
    let numberOfGames: Int
    let opponents: [Opponent]
    let originalScheduledAt: String
    let rescheduled: Bool
    let results: [Result]
    let scheduledAt: String
    let serie: Serie
    let serieID: Int
    let slug, status: String
    let streamsList: [StreamsList]
    let tournament: Tournament
    let tournamentID: Int
    let videogame: Videogame
    let videogameVersion: VideogameVersion?
    let winner: OpponentClass?
    let winnerID: Int?
    let winnerType: String?

    enum CodingKeys: String, CodingKey {
        case beginAt = "begin_at"
        case detailedStats = "detailed_stats"
        case draw
        case endAt = "end_at"
        case forfeit
        case games, id, league
        case leagueID = "league_id"
        case live
        case matchType = "match_type"
        case modifiedAt = "modified_at"
        case name
        case numberOfGames = "number_of_games"
        case opponents
        case originalScheduledAt = "original_scheduled_at"
        case rescheduled, results
        case scheduledAt = "scheduled_at"
        case serie
        case serieID = "serie_id"
        case slug, status
        case streamsList = "streams_list"
        case tournament
        case tournamentID = "tournament_id"
        case videogame
        case videogameVersion = "videogame_version"
        case winner
        case winnerID = "winner_id"
        case winnerType = "winner_type"
    }
}

// MARK: - Game
struct Game: Codable {
    let beginAt: String?
    let complete, detailedStats: Bool
    let endAt: String?
    let finished, forfeit: Bool
    let length: Int?
    let id, matchID, position: Int
    let status: String
    let winner: GameWinner?
    let winnerType: String?

    enum CodingKeys: String, CodingKey {
        case beginAt = "begin_at"
        case complete
        case detailedStats = "detailed_stats"
        case endAt = "end_at"
        case finished, forfeit, id, length
        case matchID = "match_id"
        case position, status, winner
        case winnerType = "winner_type"
    }
}

// MARK: - GameWinner
struct GameWinner: Codable {
    let id: Int?
    let type: String?
}

// MARK: - League
struct League: Codable {
    let id: Int
    let imageURL: String?
    let modifiedAt: String
    let name, slug: String
    let url: String?

    enum CodingKeys: String, CodingKey {
        case id
        case imageURL = "image_url"
        case modifiedAt = "modified_at"
        case name, slug, url
    }
}

// MARK: - Live
struct Live: Codable {
    let opensAt: String?
    let supported: Bool
    let url: String?

    enum CodingKeys: String, CodingKey {
        case opensAt = "opens_at"
        case supported, url
    }
}

// MARK: - Opponent
struct Opponent: Codable {
    let opponent: OpponentClass
    let type: String
}

// MARK: - OpponentClass
struct OpponentClass: Codable {
    let acronym: String?
    let id: Int
    let imageURL: String?
    let location: String?
    let modifiedAt: String?
    let name, slug: String?

    enum CodingKeys: String, CodingKey {
        case acronym, id
        case imageURL = "image_url"
        case location
        case modifiedAt = "modified_at"
        case name, slug
    }
}

// MARK: - Result
struct Result: Codable {
    let score, teamID: Int

    enum CodingKeys: String, CodingKey {
        case score
        case teamID = "team_id"
    }
}

// MARK: - Serie
struct Serie: Codable {
    let beginAt: String?
    let endAt: String?
    let fullName: String
    let id, leagueID: Int
    let modifiedAt: String
    let name: String?
    let season, slug: String?
    let winnerID: Int?
    let year: Int

    enum CodingKeys: String, CodingKey {
        case beginAt = "begin_at"
        case endAt = "end_at"
        case fullName = "full_name"
        case id
        case leagueID = "league_id"
        case modifiedAt = "modified_at"
        case name, season, slug
        case winnerID = "winner_id"
        case year
    }
}

// MARK: - StreamsList
struct StreamsList: Codable {
    let embedURL: String?
    let language: String
    let main, official: Bool
    let rawURL: String

    enum CodingKeys: String, CodingKey {
        case embedURL = "embed_url"
        case language, main, official
        case rawURL = "raw_url"
    }
}

// MARK: - Tournament
struct Tournament: Codable {
    let beginAt: String?
    let endAt: String?
    let hasBracket: Bool
    let id, leagueID: Int
    let liveSupported: Bool
    let modifiedAt: String
    let name: String
    let prizepool: String?
    let serieID: Int
    let slug, tier: String
    let winnerID: Int?
    let winnerType: String

    enum CodingKeys: String, CodingKey {
        case beginAt = "begin_at"
        case endAt = "end_at"
        case hasBracket = "has_bracket"
        case id
        case leagueID = "league_id"
        case liveSupported = "live_supported"
        case modifiedAt = "modified_at"
        case name, prizepool
        case serieID = "serie_id"
        case slug, tier
        case winnerID = "winner_id"
        case winnerType = "winner_type"
    }
}

// MARK: - Videogame
struct Videogame: Codable {
    let id: Int
    let name, slug: String
}

// MARK: - VideogameVersion
struct VideogameVersion: Codable {
    let current: Bool
    let name: String
}
