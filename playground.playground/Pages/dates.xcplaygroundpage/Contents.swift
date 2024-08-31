//: [Previous](@previous)

import Foundation

func createSeparator(title: String = "title", separator: String = "=", length: Int = 40) -> String {
    let totalLength = length - title.count
    let totalSeparatorLength = totalLength / 2
    let halfSeparator = String(repeating: separator, count: totalSeparatorLength)
    let separator = "\(halfSeparator) \(title) \(halfSeparator)"
    return separator
}


print(createSeparator(title: "Calendar"))
print("El calendario actual es: \(Calendar.current)")
print("La zona horaria del calendario actual es: \(Calendar.current.timeZone)")

var gregorianCalendar = Calendar(identifier: .gregorian)
gregorianCalendar.locale = Locale.autoupdatingCurrent

let birthdayComponents = DateComponents(
    calendar: gregorianCalendar,
    timeZone: TimeZone(identifier: "America/Mexico_City"),
    year: 1996,
    month: 4,
    day: 2
)

if let birthdayDate = gregorianCalendar.date(from: birthdayComponents) {
    print("Fecha de cumpleaños: \(birthdayDate.description(with: Locale.autoupdatingCurrent))")
} else {
    print("No se pudo crear la fecha.")
}

let now = Date()
var userLocale = Locale.autoupdatingCurrent
let fiveSecondsAgo = Date(timeIntervalSinceNow: -5)
let eightMinutesFromNow = Date(timeIntervalSinceNow: 8 * 60)

print(">>> Fecha actual: \(now)")
print(">>> Fecha hace 5 segundos: \(fiveSecondsAgo.description(with: userLocale))")
print(">>> Fecha hace 8 minutos: \(eightMinutesFromNow.description(with: userLocale))")


let momentInTime = Date()

print("moment.description: \(momentInTime.description)")

print("Date descriptions in different locales:")
print(">>> en-US description \(momentInTime.description(with: Locale(identifier: "en-US")))")
print(">>> en-GB description \(momentInTime.description(with: Locale(identifier: "en-GB")))")
print(">>> es description \(momentInTime.description(with: Locale(identifier: "es")))")
print(">>> zh-Hans description \(momentInTime.description(with: Locale(identifier: "zh-Hans")))")


//: [Next](@next)
