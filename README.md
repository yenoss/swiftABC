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









