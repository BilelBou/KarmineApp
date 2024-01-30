import SwiftUI

enum TabsView: CaseIterable {
    case calendar
    case history

    var viewModel: MatchesViewModel {
        switch self {
        case .history:
            return HistoryViewModel(leagueRequest: .karmineHistoryRequest(acessToken: "9acau15uxBEF2W_Qb4IcY8Lwgcs4tYCyuMzjFv1kLEGVd0Wu57g"))
        case .calendar:
            return CalendarViewModel(leagueRequest: .karmineComingMatchesDetailRequest(acessToken: "9acau15uxBEF2W_Qb4IcY8Lwgcs4tYCyuMzjFv1kLEGVd0Wu57g", id: "129570"))
        }
    }

    var title: String {
        switch self {
        case .history:
            return "Historique"
        case .calendar:
            return "Calendrier"
        }
    }

    var index: Int {
        return TabsView.allCases.firstIndex(of: self) ?? 0
    }

    var count: Int {
        return TabsView.allCases.count
    }
}
