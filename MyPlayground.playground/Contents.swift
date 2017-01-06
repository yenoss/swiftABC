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













