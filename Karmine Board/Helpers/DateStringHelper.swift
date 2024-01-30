import Foundation

struct DateStringHelper {
    static func extractDatetimeString(from date: String) -> String {
        let dateFormatter = DateFormatter()
        let tempLocale = dateFormatter.locale
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"

        if let date = dateFormatter.date(from: date) {
            dateFormatter.dateStyle = .full
            dateFormatter.timeStyle = .short
            return dateFormatter.string(from: date)
        }

        return "Error 00:00"
    }
}
