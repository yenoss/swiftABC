Swift ABC Doc
========


Apple "The Swift Programming Language (Swift 3.0.1)" 언어 문서를 공부합니다.


#####목표
* Daily Commit.

* 언어 기본사용에 익숙해지기.

* 언어적 기본사용에 익숙해지기.



Day 1
------------

<br>
###기본..
- 세미콜론 더 이상 필요하지 않다.
- constnat value 인 let은 꼭 1번만 선언해야한다.(한번선언하고 많은곳에서 사용할때)
- 타입은 초기 init일떄의 값으로 기억한다.
- value는 절대로 은연중 다른타입으로 변하지 않는다. (즉 한번선언하면 계속 그타입으로 가진다는이야기)
- 해서 String(value)등으- 로 value를 형변환해주야한다.
- 스트링 내부에서 쓸때 백슬래시를 통해 타입을 스트링화할수있다.\(value

###array,dictionary..
- array,dictionary타입은 bracket을 쓴다
- [String](), [String:Float]() 으로 초기화하고 기존 것은 [], [:] 으로 초기화한다
- a  ??  b 는 a가 옵셔널밸류이고 null이되게되면 b가 default로 들어간다는 의미이다.
- optionalValue은 nill이 들어 갈 수 있는 value 이고 해당 nil에대해  런타임에러를 사전에 컴파일에러로 방지하기위함이다. (swift가 type safe한 언어인 이유)

###Loop..
- for i in 0..<4 0~3까지.
- for i in 0…4 0~4까지.
- do while => repeat while 정도..

Day2
------------


###func..
- 파라미터에 언더바를 먼저 쓰게되면 => 이는 파라미터명을 생략해도된다. on day 이런식으로 띄어쓰면 앞에 on을 파라미터명으로 쓰겟다.( greet(_ person:String, on day:String)->String{}...
- 함수는 리턴값을 여러개로 사용할 수도 있다.
- sumOf(numbers: Int…) -> int {} 와같이 많은 파라미터를 배열로 받을 수 있다.
- nestedFunction을 사용할 수있다. 함수내에 함수가 가능하며 블락안에 variable은 공유된다.
- 내부함수를 리터해 줄수도 있다. 그럴땐 최초 겉의 함수의 리턴타입이 내부함수의 파라미터,리턴타입과 같아야한다.(func test() -> ((Int)->(int){} 라면 내부에 func testt(number:Int) -> Int {} 같은 함수가 존재하여야 한다.
- 내부 함수의 경우 조건이 들어갈 수도있다.
- array.map은 클로저로 각 항목들을 반영한 결과물을 가진 새로운 배열을 반환한다.
	
     ~~~
     //배열을 선언
     let numbers = [1,2,3,4]
     //map을통해 내부 블락함수로 돌린 결과의 배열을 리턴한다. 
     let data = numbers.map({
     	(number:Int) -> Int in
     		return 3*number
     })
     ~~~
- 클로져에서 받는 인자는 $0 $1 ... 등과같이 간단히 받을 수 있다.

Day 3
------------
###Class..

- 클래스는 기본적으로 멤버변수, 그리고 함수로 이루어져있다.
- init을 통해 생성자를 사용할 수 있다.

	~~~
	//와 같이 상속할 수있다.
	class Square: NamedShape{}	
	~~~
	
- super.init()을 통해 상속 클래스의 생성자를 만들수있고,
- override 문구를 통해 부모 클래스의 함수를 오버라이딩 할 수 있다.
- value에 get{}, set{} 을 넣을 수 있고 해당 데이터를 그냥 불러서 사용하면 get{}이 호출되고 설정하면 set{}이 설정된다.

~~~
var permieter: Double{
        get {
            return 3.0 * sideLength
        }
        set {
            sideLength = newValue / 3.0
        }
    }
~~~

- setter의 newValue는 암시된 새로운 값을 의미한다.

Day 4
------------


###Enum..

~~~
enum Rank: Int{
	ace = 1
}
~~~

- Rank.ace 는 ace를 반환한다.
- rawValue를 이용해 숫자값을 받아올 수 있다.(Rank.ace.rawValue 는 1을 반환한다.)
-  위 예제에서의 enum 은 생성자로 기본 Rank(rawVlaue:)를 가지고 해당 문자를 리턴한다. 
- enum으로 case를 분류하여 해당 case일 경우 파라미터를 가지고 어떻게 보여줄 것인지 나타낸다.
- struct는 구조체를 만든다. 클래스와 같지만 클래스는 참조하는 반면 구조체는 매번 복사하는 형태다

###Protocol.. 

- 프로토콜은 인터페이스다. 최소한 가저야할 속성 메소드등을 가진다.
- struct는 열거형임으로 value의 타입등을 변경할 수 없다. 그러나 mutating keyword를 통하면 변경이 가능하다. 

###Extension..

~~~
extension Int: ExampleProtocol {
    var simpleDescription: String {
        return "the number \(self)"
    }
    mutating func adjust() {
        self += 42
    }
}
print(7.simpleDescription)
~~~

- 카테고리이다 위와같이 기본 타입 Int에 simpleDescription이라는 함수를 추가해서 사용한다.

~~~
let protocolValue: ExampleProtocol = a
~~~

- 위와같이 기존 클래스에 variable로 프로토콜을 추가 할 수 있다.

###ErrorHandler..

~~~
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
~~~

- 에러 케이스를 enum: Error로 작성할 수 있다. 
- 해당 에러를 try catch로 잡을수 있고 throw를 통해 에러를 발생시킨다.
- differ{} 는 함수내부의 모든 코드에서 가장 마지막에 실행된다. 


###Generics..

~~~
//item타입으로 배열을 만들고 계쏙 아이템 타입으로 append하겠다.
func makeArray<Item>(repeating item: Item, numberOfTime: Int) -> [Item]{
    
    var rsult = [Item]()
    
    for _ in 0..<numberOfTime{
        rsult.append(item)
    }
    return rsult
}

makeArray(repeating: "knock", numberOfTime: 4)

~~~

- 타입에 자유로운 제네릭 함수이다.


Day 5
------------

###TypeSafety..
* 스위프트는 타입 세이프하다. 
* 기본적으로 typeAnotation을 하지 않을 경우 해당 타입을 추론해 적합한 타입으로 명시한다. 
* 왠만하면 타입을 명시해주는것이 좋겠다.

###type Conversion..
* 형변환은 아래와같이하다.

~~~
	let valueDouble = 0.123
	let valueInt = Int(valueDouble)			
~~~


###Type Aliaces
* 타입을 alias할수 있다. 

~~~
	typealias AudioSample = UInt16
	var maxAmplitudeFound = AudioSample.min
~~~


### Tuple
* 튜플형태를 제공해준다. 쓰기 매우 간단하네~

~~~
	let http404Request = (404, "not Found")
	print(http404Request.0)
	print(http404Request.1)

	let (code,reason) = http404Request
	print(code)
	print(reason)

	let http200Stauts = (statusCode:200, description: "OK")
	print(http200Stauts.statusCode)
	print(http200Stauts.description)	
~~~


###Optional 2
* 옵셔널은 value가 애매할때 사용된다. 

~~~
let possibleNumber = "123"
let convertedNumber = Int(possibleNumber)
print(convertedNumber)
~~~

* convertedNumber는 int 가 아니라 optional(Int)가 된다. 의미는 해당 값이 `어떠한 int` 혹은 `nil`일 수 있다는 것이다.
* 이유는 컴파일러입장에선 possibleNumber가 String값이 => Int로 변환되는곳에서 항상 해당 String이 숫자임을 보장 할 수 없는 상태이다. 즉 "sample" 같은 텍스트가 들어가게되면 Int변화에서 nil값이 도출되수도 있는 상태인것이다. 
> 고로 매우 애매한 상태다, 이러한 상태가 존재해버리면 safe 하지 않다.

* 위와같은 상황을 알려주고 해당 상황을 보다 safe하게 변환시켜줄 필요가 있다.

###OptionalBinding
* 옵셔널 바인드다. 해당 값이 nil값인지 체크하게 되어 보다 safe한 코드가 될 수 있다. 



~~~
let possibleNumber = "123"

if let convertedNumber = Int(possibleNumber){
    print("convertedNumber= \(convertedNumber)")
}else {
    print("nope")

~~~

* 항사 위와같은 코드를 통해 optional한 경우 binding해주는 것이 좋다.

####Implicityly Unwrapped Optional
* pass

Day 6
---

### basic operators

~~~
	let(x,y) = (1,2)   
~~~

* 초기화를 멀티플로 할수 있다.
* -9 % 4 = > -1 을 반환한다
* tuple의 비교는 두개중 하나만 맞으면 true를 반환한다.

~~~
let defaultColorName = "red"
var userDefinedColorName: String?
var colorNametoSUer = userDefinedColorName ?? defaultColorName
~~~

* nilcoalscing operation(??)은 위와 예제와 같이 사용된다. nil일경우를 판별해 분기해준다.

### STring And Character 

~~~
	var empty = ""
	var anotherEmpty = String()
~~~ 

* 위와같이 초기화 할 수 있고 isEmpty 로 비어있는지 확인이 가능하다.


Day 7
---
###CollectionType

* 3가지 주요한 콜랙션이 있다. 
* array,set,dictionary이다. 
* 기본적으로 콜렉션은 mutable하다.

#####array
* [Int]() 로 초기화한다. 
* 이제 위의 array는 Int가 들어갈것이라 생각되어진다. 
* [] 로 선언하여 다시 초기화 할 수있다.

~~~
	var threeDoubles = Array(repeating:0.0,count:3)
~~~


* repeat,count 초기화로 연속적 초기화가 가능하다
* array 끼리의 + 연산은 두 어레이를 이어서 연결해준다. (원소끼리 더하는것은 아니다)

* bracket을 통해 초기화할 수 있다

~~~
	var shppoingListWithBrackets: [String] = ["saousage","carrot"]

~~~

* swift는 똑똑해서 

~~~
	var shoppingList = ["eggs","milk"]
~~~

* 와같이 하여도 두개의 타입을 보고 String이라고 추론한다.
* count,isEmpty같은 함수들을 내장한다. 

~~~
	shoppingList += ["pizza","banan"]
~~~

* += 는 뒤에 리스트를 추가로 붙여준다.
* append 함수를 대신하여 쓸 수 있다.

~~~
	shoppingList[4...6] = ["a","b","c"]
~~~

* 위와같이 범위로 한방에 바꿀 수 있다.
* insert,remove등 다양한 함수 존재.

~~~
	for (index,value) in shoppingList.enumerated() {
    print("index = \(index) value =\(value)")
    }

~~~

* enumberated를 통해 반복문을 쓸 수 있다.


day 8
---
####Set
* (hashble)모든 swift의 기본타입(String,Int..) 는 해시블이 디폴트이다. 그래서 벨류나 키값으로 이용될 수 있다.

~~~
	var letters = Set<Character>()
	var favoriteGenres: Set<String> = ["Rock","Classic","hiphop"]
~~~
* 위와 같이 초기화 할 수 있다.
* 그러나. swift는 타입을 추론함으로

~~~
	var favoriteGenress: Set = ["Rock","clasic"]
~~~

* 이렇게 쓸 수도 있다.
* insert,count,isEmpty등의 함수가 지원된다.
* 그외의 set의 특성을가진 union,insersection,substracting,symmetricDifference등이 제공된다.

####Dictionary

* 각 value는 고유의 key와 맵핑된다.

~~~
	var numberOfIntegers = [Int:String]()
numberOfIntegers[10] = "hi"
~~~

* 위와같이 초기화하고 입력한다.

~~~
	var airports: [String: String] = ["aaa":"asiana","bbb":"koreanAir"]
~~~

* 당연 키페어로 리터럴하게사용가능.

~~~
	var airports = ["aaa":"asiana","bbb":"koreanAir"]
~~~

* 어레이,셋과마찬가지로 위와같이 입력할 수 있다. 모두 같은 타입이기에 가능한것이다. 

~~~
	for (portCode,portName) in airports {
    	print(portCode)
	    print(portName)
	}
~~~

* 위와같이 포루프를 사용할 수 있다.

~~~
	for portCode in airports.keys{
	    print(portCode)
	}
	for portCode in airports.values{
    	print(portCode)
	}
~~~

* 키와 벨류도 손쉽게 추출가능하다

~~~
	let airportCode = [String](airports.keys)
~~~

* 키값만, 벨류값만 arr로 추출할 수 있다.


day 9
====

####Function

* func이란 키워드를 앞에 달아 사용 할 수 있다. 
* 리턴 타입을 -> 를 통해 정해준다.
* 함수 기입방식이다르지 사용한방법은 일반언어와 크게 다르지 않다.


~~~
	func returnMultiple(array: [Int]) -> (first: Int,second: Int){
    
    
	    return (array[0],array[1])
	}

	var array = [1,2,3,]

	returnMultiple(array: array).0
~~~

* 다만 특이하게 리턴을 여러개 받을 수 있다.
* 함수에서 nil이 떨어질 수 있을경우 리턴값에 ? 를붙여 옵셔널일수있다는 것을 명시해주고 처리해줘야한다.

~~~
	func ssum(a first: Int, b sec: Int) -> Int 
~~~

* 위와같이 함수호출시 파라미터명과 실제 함수내부에서 쓰는 파라미터를 설정해 줄 수 있다.
* 처음 파라미터는 _ 를 이용하여 안 받을 수 있다.

~~~
	func ssum(_ first: Int, b sec: Int = 12) -> Int {
~~~

* default value를 설정할 수 있다.값이 없을 경우 default값이 들어간다.

~~~
	func sumsArray(_ numbers: Int ...) -> Int 
	print(sumsArray(1,2,3,4,5))
~~~

* variable을 ... 으로 순차대로 배열로 받고 이를 array와 같이 사용할 수 있다.

day 10
=====

functiontype
----

* 함수타입이란, 함수 파라미터, 그리고 리턴값에 대한 타입 갯수에 관한 이야기다.

~~~
	func addTwoInts(_ a: Int, _ b: Int) -> Int 
	func multiplyTwoInts(_ a: Int, _ b: Int) -> Int 
~~~

* 위의 두함수의 함수타입은 2개의 Int를 파리미터로 받고 Int타입으로 리턴함을 의미한다. 

usingFunctionType
---
~~~
	var mathFunction: (Int,Int) -> Int = addTwoInts
~~~

* mathFunction은 인트두개를 파라미터로받고 인트를 리턴한다는 타입을 가지고 addTowInts함수를 부른다 는것을 의미한다.
* 쉽게 함수의 타입을 일반 Int,String과 같이 선언한다고 생각하면 된다.

~~~
	print("\(mathFunction(2,3))")
~~~

* 위의결과는 2+3 인 5가 나오게된다.

~~~
	mathFunction = multiplyTwoInts
~~~

* 위와 같이 선언하면 해당 variable(mathFunction)이 2*3 6의 결과를 출력되게된다.


* 이 functionType은 함수의 파라미터로 사용될 수 있다. 

~~~
	func printMathResult(_ mathFunction: (Int, Int) -> Int, _ a: Int, _ b : Int) {
    	print("result => \(mathFunction(a,b))")
	}

	printMathResult(mathFunction, 5, 3)
~~~

* (Int,Int) -> Int 타입의 변수가 첫번째 파라미터로 들어가면 된다. 
* 그리고 함수 내부에서 해당 타입을 가진 함수의 값을 콜 한다. 
* 위에서 우리가 mathFunction을 multiplyTwoInts라고 선언하였음으로 해당 함수가 콜되어 5*3 인 15의 값이 출력되게된다.

* 함수타입은 리턴 타입에도 사용될 수 있다.

~~~
	var	currentValue = 3 
	func stepForward(_ input:Int) -> Int {
   	 	return input + 1
	}
	func stepBackward(_ input:Int) -> Int {
    	return input - 1
	}
	func choseStepFucntion(backword: Bool) -> (Int) -> Int {
    	return backword ? stepBackward : stepForward
	}
	var currentValue = 3
	//현재값이 0보다 클경우 true가 됨을 stepBackword를 호출하고 input+1을 하고 해당 int를 리턴 한다
	let MoveNearerTozer = choseStepFucntion(backword: currentValue > 0 )
print(MoveNearerTozer(3))

~~~

* chooseStepFucntion의 파라미터와 리턴값들은 첫번째로 불리언값을 파라미터로가지고 두번째로 steopbackward,stepForward에 들어갈 파라미터를 받게된다. 그리고 가장 마지막 최종리턴될 타입을 나타낸다. 
* 일단 MoveNearerTozer는 중간 stepBackword,steopForward 파라미터값을 제외하고 최초 choseTepFunction에서 사용될 backword만을 받아 조건만을 정해준다. 여기서는 currentVlaue값이 0보다 크냐? 를 불리언으로 넘겨주게된다.
* 이후 MoveNearerTozer를 호출할경우 stepBackwarod or step Forward에  파라미터로 들어갈 값을 넣어준다. 
* 그렇게되면 
	*  앞에 currentVlaue값의 비교를 통해 stepBackword, stepForward어느 함수로 갈지 정해지고 
	* MoveNearerTozer(3)의 3의값이 정해진 함수(stepBackword or stepForward)로 넘어가게되고
	* 해당 함수에서의 리턴값을 다시 반환하게 되는 것이다.
	
* 현재상황에선 currentVlaue가 3이고 0보다 큼으로 true 이며
* stepBackward를 호출하고 파라미터에(input)에 3이 들어가게되어 3-1 이 리턴되어 최종 2의값이 MoveNearerTozer 반환되어진다.























