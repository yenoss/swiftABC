Swift ABC Doc
========


Apple "The Swift Programming Language (Swift 3.0.1)" 언어 문서를 공부합니다.


#####목표
* Daily Commit.
* 언어적 기본사용에 익숙해지기.



Day1
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

###Extension

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

###ErrorHandler

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


###Generics

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







