//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

print("Hellow,world")

var myVariable = 42
myVariable = 24

let doulbeData = 70.0

let explitData: Double = 660.6

let label = "this"

let width = 30

let widthLabel = label + String(width)

let widthLabel2 = "hi myname is \(width + width)"


var shoppingList = ["cat","horse","exp"]

shoppingList[0] = "test"

shoppingList


var occupations = [
    "Malcolm": "Captain",
    "KeyLee": "Mecahnime",
]

occupations["test"] = "abc"

occupations["Malcolm"]

occupations


//empty

var emptyArray = [String]()
var emptyDict = [String: Float]()

emptyDict["hi"] = 20.0

emptyDict

// 
emptyArray = []
emptyDict = [:]


let individualScore = [ 75,43,103,85,11]
var teamScore = 0

for score in individualScore{
    
    if score > 50 {
        teamScore += 3
    } else {
        teamScore += 1
    }
}

print(teamScore)



var optionalString: String? = "Hello"
print(optionalString == nil )

var optionalName: String? = nil
var greeting = "Hello!"

//만약 optionalName == nil일경우 해당 브레킷은 패스된다.
if let name = optionalName {
    greeting = "Hello, \(name)"
} else {
    greeting = "else"
}


let nickName: String? = "test"
let fullName: String = "John appleseed"

//nickName이 옵셔널 밸류이고 nill일경우 fullName이 default로 들어간다.
let informalGreeting = "hi \(nickName ?? fullName)"



let interestingNumbers = [
    "Prime": [2,3,5,7,11,13],
    "Fibonacci": [1,1,2,3,5,8],
    "Square": [1,4,9,16,25],
]

var largest = 0

for (kind, numbers) in interestingNumbers {
    
    for number in numbers{
        if number > largest {
            largest = number
        }
    }
}
print(largest)


var n = 2
while n < 100 {
    n = n*2
}
print(n)

var m = 2
repeat {
    m = m*2
}while m < 100

print(m)


var total = 0

for i in 0...4{
    total += i
}
print(total)



func great(person: String, day: String) -> String {
    return "Hello\(person) \(day)"
}

great(person: "Bob", day: "Tuesday")



func greet(_ person:String, on day:String)->String {
    return "person \(person) \(day)"
}

greet("hiNoneData",on: "monday")



func cal(scores: [Int]) ->(first: Int, second: Int, third: Int){
    var last = scores[2]
    
    return (scores[0],scores[1],last)
}
let cals = cal(scores:[1,2,3])

print(cals.first)
print(cals.0)
print(cals.1)
print(cals.2)

















