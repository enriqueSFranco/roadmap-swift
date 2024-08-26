//: [Previous] (@previous)
var greeting = "Hello, playground"

// NULLABILIDAD
var name = "kratos"
var otherName: String? = nil

func setName(_ name: String) {}

setName(name)
setName(otherName ?? "Anonymous")

//: [Next] (@next)
