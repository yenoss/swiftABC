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
    let last = scores[2]
    return (scores[0],scores[1],last)
}
let cals = cal(scores:[1,2,3])

print(cals.first)
print(cals.0)
print(cals.1)
print(cals.2)


func sumOf(numbers: Int...) -> Int {
    var sum = 0
    for number in numbers {
        sum += number
    }
    return sum
}
sumOf(numbers: 10,20,40)

func returnFitteen() -> Int {
    var y = 10
    func add(){
        y += 5
    }
    add()
    return y
}

returnFitteen()


//리턴값이 조금이상하다..
func makeIncremnter() -> ((Int) -> Int){
    func addOne(number: Int) -> Int{
        return 1+number
    }
    return addOne
}

//make Incrementer는  addOne이라는 함수를 리턴한다. 파라미터는 addOne의 파라미터를 따른다.
var inicrement = makeIncremnter()
inicrement(10)


//함수를 조건으로 사용하여 만들어 사용할수있다.
//아래와같이 conditiondㅣ라는 함수를 포로프에서 돌려서 해당값이 트루이면 투르를 리턴하게 한다.
func hasAnyMatches(list: [Int], condition: (Int) -> Bool) -> Bool {
    for item in list {
        if condition(item) {
            return true
        }
    }
    return false
}

func lessthenTen(number:Int) -> Bool {
    return number < 10
}
var numbers = [1,2,3,4]

hasAnyMatches(list: numbers, condition: lessthenTen)


//map은 클로저로 각 항목들을 반영한 결과물을 가진 새로운 배열을 반환한다.
let data = numbers.map({
    (number: Int) -> Int in
    
    return 3 * number
})

for d in data {
    print(d)
}





var nums = [1,2,3,4,5]


nums.map({
    (nums:Int) -> Int in
    return nums*3
})

nums.map({
    num in 3*num
})


let sortedNumbers = nums.sorted { $0 > $1}


let heelo: (String, String,String) -> String = { $1 + $0 + $2 + "good"}
heelo("hi","nice",")))")


class Shape {
    var numberOfSides = 0
    func simpleDescription() -> String {
        return "a shape with \(numberOfSides)"
    }
}

var shape  = Shape()

shape.numberOfSides = 30

shape.simpleDescription()


class NamedShape {
    var numberOfSides: Int = 9
    var name: String
    
    init(name: String){
        self.name = name
    }
    func simpleDesction() -> String {
        return "return shpae is \(numberOfSides)"
    }
}

var nameShape = NamedShape(name:"test")
nameShape.simpleDesction()


class Square: NamedShape{
    var sideLength: Double
    init(sideLength: Double, name: String){
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 4
    }
    
    func area() -> Double {
        return sideLength * sideLength
    }
    
    override func simpleDesction() -> String {
        return "test"
    }
}

var square = Square(sideLength: 4, name: "hi yo")
square.area()
square.simpleDesction()



class EquilateralTriangle: NamedShape{
    var sideLength: Double = 0.0
    
    init(sideLength: Double, name: String){
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 3
    }
    var permieter: Double{
        get {
            return 3.0 * sideLength
        }
        set {
            sideLength = newValue / 3.0
        }
    }
    
}

var eequ = EquilateralTriangle(sideLength: 3.1,name: "hiyo")
print(eequ.permieter)
eequ.permieter = 9.9
print(eequ.sideLength)


class TriangleAndSquare {
    var triangle: EquilateralTriangle{
        willSet {
            square.sideLength = newValue.sideLength
        }
    }
    init(size: Double, name: String){
        square = Square(sideLength: size, name: name)
        triangle = EquilateralTriangle(sideLength: size,name: name)
    }
}

var triangleAndSquare = TriangleAndSquare(size: 10, name: "another test")



enum Rank: Int {
    case ace = 1
    case two, three, four, five, six, seven, eight, nine, ten
    case jack, queen, king
    func simpleDiscription() -> String {
        switch self{
        case .ace:
            return "acee"
        case .jack:
            return "jack"
        case .queen:
            return "queen"
        case .king:
            return "king"
        default:
            return String(self.rawValue)
        }
    }
}

let ace = Rank.ace

let aceRawValue = ace.rawValue
Rank.three.rawValue


if let convertedRank = Rank(rawValue: 3){
    convertedRank
    let threeDescription = convertedRank.simpleDiscription()
    print(threeDescription)
}


enum Suit{
    case spades, hearts, diamonds, clubs
    func simpleDiscription() -> String {
        switch self {
        case .spades:
            return "spades"
        case .hearts:
            return "hearts"
        case .diamonds:
            return "diamond"
        case .clubs:
            return "clbus"
        }
    }
}
Suit.spades

Suit.spades.simpleDiscription()


enum ServerResponse {
    case result(String,String)
    case failure(String)
}

let success = ServerResponse.result("5:00","9:00")
let failure = ServerResponse.failure("failt")

switch failure {
case let .result(sunrise, sunset):
    print("Suriinse is \(sunrise) and suns et\(sunset)")
    
case let .failure(message):
    print("faile \(message)")
}

struct Card{
    var rank: Rank
    var suit: Suit
    func simpleDescription() -> String {
        return "The \(rank.simpleDiscription()) of \(suit.simpleDiscription())"
    }
    
}
//랭크와 수트를 설정해준다.
let threeofSpades = Card(rank: .three,suit: .spades)

let threeofSpadesDescription = threeofSpades.simpleDescription()


protocol ExampleProtocol {
    var simpleDescription: String { get }
    mutating func adjust()
}


class SimpleClass: ExampleProtocol {
    var simpleDescription: String = "A very Simple class"
    var anotherProperty: Int = 69105
    func adjust(){
        simpleDescription += " now 100% adjusted"
    }
}

var a = SimpleClass()

a.adjust()
let aDescription = a.simpleDescription

struct SimpleStructure: ExampleProtocol {
    var simpleDescription: String = "A Simple Structure"
    mutating func adjust() {
        simpleDescription += " (adjusted"
    }
}

var b  = SimpleStructure()
b.adjust()
b.simpleDescription

extension Int: ExampleProtocol {
    var simpleDescription: String {
        return "the number \(self)"
    }
    mutating func adjust() {
        self += 42
    }
}
print(7.simpleDescription)

let protocolValue: ExampleProtocol = a
print(protocolValue.simpleDescription)


enum PrintError: Error {
    case OutOfPaper
    case noToner
    case onFire
}
func send(job: Int, toPrinter printerName: String) throws -> String {
    if printerName == "Never Has Toner"{
        throw PrintError.noToner
    }
    return "job sent"
}
do{
    let printerResponse = try send(job:1040,toPrinter:"Never Has Toner")
}catch{
    print(error)
}



let printerSuccess = try? send(job: 1884, toPrinter:"message")
//let printerSuccess = try? send(job: 1884, toPrinter:"Never Has Toner")
var fridgeIsOpen = false
let fridgeContent = ["milk","egges","leftovers"]

func fridgeContains(_ food: String) -> Bool {
    fridgeIsOpen = true
    //모든 코드가 실행된뒤 실행됨
    defer {
        print("differ")
        fridgeIsOpen = false
    }
    let result = fridgeContent.contains(food)
    return result
}

fridgeContains("banana")


//item타입으로 배열을 만들고 계쏙 아이템 타입으로 append하겠다.
func makeArray<Item>(repeating item: Item, numberOfTime: Int) -> [Item]{
    
    var rsult = [Item]()
    
    for _ in 0..<numberOfTime{
        rsult.append(item)
    }
    return rsult
}

makeArray(repeating: "knock", numberOfTime: 4)



//var text1: String = "hi"
//var text2: String = nil

func pizzaMachine (_ menu: String) -> String? {
    if(menu == "super"){
        return "super Pizza"
    }else if(menu == "cheeze"){
        return "super Cheeze"
    }
    
    return nil
}


//let pizzaName: String? = pizzaMachine("supers")



//if let pizzaName = pizzaMachine("super"){
//    print("my pizza is \(pizzaName)")
//}else{
//    print("no pizza//null")
//}

//let pizzaNames = pizzaMachine("super")?.toSTring()
//print(pizzaNames)



//if let temp = pizzaName{
//        print(temp)
//}else{
//        print("nill")
//}


//COnstants and Variable



let valueDoube = 0.13455
let valueInt = Int(valueDoube)
print(valueInt)


typealias AudioSample = UInt16
var maxAmplitudeFound = AudioSample.min


let http404Request = (404, "not Found")
print(http404Request.0)
print(http404Request.1)

let (code,reason) = http404Request
print(code)
print(reason)

let http200Stauts = (statusCode:200, description: "OK")
print(http200Stauts.statusCode)
print(http200Stauts.description)


let possibleNumber = "123"

if let convertedNumber = Int(possibleNumber){
    print("convertedNumber= \(convertedNumber)")
}else {
    print("nope")
}
//let convertedNumber = Int(possibleNumber)



//errHandling

func canThrowAnError() throws {
}


//day6
//멀티플
let(x,y) = (1,2)

print(x)
print(y)


-9 % 4

let three = 3

print(-three)

(1, "zebra") < (2,"apple")

(3, "cpple") < (3, "bird")

//var c = 3

//c != nil ? a! : b

let defaultColorName = "red"
var userDefinedColorName: String?
var colorNametoSUer = userDefinedColorName ?? defaultColorName
//만약 userDefaultColorName이 null이면 red로 셋한다.


for index in 1...4 {
    print("hi \(index)")
}

for index in 1..<3 {
    print("2hi \(index)")
}

var emptyString = ""

if emptyString.isEmpty {
    print("is empty")
}

let catcharactesr: [Character] =  ["C","a","t"]

let catString = String(catcharactesr)

var stringHi = "hi"
stringHi.append("test")


//array

var someInt  = [Int]()

print("someInt sis type Int , \(someInt.count)")


someInt.append(3)

for data in someInt {
    print(data)
}

var threeDoubles = Array(repeating: 0.0, count: 3)
for data in threeDoubles {
    print(data)
}

var shppingList = [String]()

var shppoingListWithBrackets: [String] = ["saousage","carrot"]

shoppingList += ["pizza","banan","test","hh"]

shoppingList[4...6] = ["a","b","c"]

for data in shoppingList{
    print(data)
}


for (index,value) in shoppingList.enumerated() {
    print("index = \(index) value =\(value)")
}



var arrayTest: [String] = ["apple","banana"]
var arrayTest2 = ["a","b"]


var ar1 = [String]()
var ar11 = ["a","b"]
var ar12: [String] = ["a","b"]


//Set

var letters = Set<Character>()
letters.insert("a")


var favoriteGenres: Set<String> = ["Rock","Classic","hiphop"]

var favoriteGenress: Set = ["Rock","clasic"]

// Dictionary

var numberOfIntegers = [Int:String]()
numberOfIntegers[10] = "hi"

var airports: [String: String] = ["aaa":"asiana","bbb":"koreanAir"]

for (portCode,portName) in airports {
    print(portCode)
    print(portName)
}

for portCode in airports.keys{
    print(portCode)
}

let airportCode = [String](airports.keys)


//func

func greets(person:String) -> String {
    return "hi \(person)"
}

greets(person: "john")

func returnMultiple(array: [Int]) -> (first: Int,second: Int){
    
    
    return (array[0],array[1])
}

var array = [1,2,3,]

returnMultiple(array: array).0


func returnMultiples(array: [Int]) -> (first: Int,second: Int)?{
    
    if array.isEmpty { return nil }
    var val1 = Int()
    var val2 = Int()
    
    if array.count<3 {
        val1 = 10
        val2 = 20
    }
    return (val1,val2)
}

var arrayss = [1,2,3,4,5]

//print(returnMultiples(array: arrayss))

if let value = returnMultiples(array: arrayss) {
    print("good not null \(value)")
}else {
    print("null optional")
}


func ssum(_ first: Int, b sec: Int = 12) -> Int {
    
    return first + sec

}
print(ssum( 10, b: 20))


func sumsArray(_ numbers: Int ...) -> Int {
    var sums = 0;
    for number in numbers{
        sums += number
    }
    return sums
}

print(sumsArray(1,2,3,4,5))


