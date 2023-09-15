import UIKit

var greeting = "Thank you"

/*
## Batch #22 / iOS Class
 Remote Learning Assignment - Week 2
 
 Part 1: Object-Oriented Swift
 */

/* 1. Declare a class Animal with a property gender and a method eat() . The data type of gender should be enum Gender as below and when you call eat() method, it will print “I eat everything!”
enum Gender {
 case male
 case female
 case undefined
 } */

enum Gender {
    case male
    case female
    case undefined
}

class Animal {
    var gender: Gender
    
    init(gender: Gender) {
        self.gender = gender
    }
    
    func eat() {
        print("I eat everything!")
    }
}

//測試
let myCat = Animal(gender:.undefined)
myCat.eat( )


/*
## 2. Declare three classes: Elephant , Tiger , Horse that inherits from Animal and override the eat() method to print what they usually eat.
 */

class Elephant: Animal {
    override func eat() {
        print("I eat fruits.")
    }
}

class Tiger: Animal {
    override func eat() {
        print("I eat meat.")
    }
}

class Horse: Animal {
    override func eat() {
        print("I eat grass.")
    }
}

//測試
let aElephant = Elephant(gender: .female)
let aTiger = Tiger(gender: .undefined)
let aHorse = Horse(gender: .male)

aElephant.eat()
aTiger.eat()
aHorse.eat()

/*
## 3. Declare a class Zoo with a property weeklyHot which means the most popular one in the zoo this week. The codes below can’t work correctly, please find what data type should A be and solve the problem. Note that tiger , elephant , and horse are instances of class Tiger, Elephant, and Horse respectively.
class Zoo {
var weeklyHot: A
    init(weeklyHot: A) { }
}
let zoo = Zoo(weeklyHot: Tiger())

zoo.weeklyHot = tiger
zoo.weeklyHot = elephant
zoo.weeklyHot = horse */

class Zoo<A> {
    var weeklyHot: A
    
    init(weeklyHot: A) {
        self.weeklyHot = weeklyHot
    }
}
//測試
let zoo = Zoo(weeklyHot: Tiger(gender: .female))
zoo.weeklyHot

// ## 4. What is an instance? What does Initilizer do in Class and Struct?
/*
 instance - 是指類似 class, struct 有類型、運算方式、數值等實體的存在。
 Initilizer - 按照字面上是有初始化的意思，使用在 Class 和 Struct 當中，用意是設置一個初始值，設定這一串程式碼中的 defult 值。
 */
// ## 5. What’s the difference between Struct and Class ?
/*
 Struct - 無繼承功能；除非重新定義，不然初始值不會改變。
 Class - 有繼承功能；可變更數值，不用重新賦予初始值。
*/

// ## 6. What’s the difference between reference type and value type ?
/*
 reference type 指偏參考性質而非實體的值，例如 functions, closures, classes 等。
 value type 指的是各個實質變數，例如 int, float 等。
 */

// ## 7. What’s the difference between instance method and type method ?
/* instance method 是需要先生成一個實體的類別，才能套用的方法；
 type method 不需要產生實體的類別，便可引用使用，常見的是搭配 class 或 static 使用。 */

// ## 8. What does self mean in an instance method and a type method respectively?
/* self 通常是用來判別當下所想要指定的數值，如果去掉 self 的情況下，程式 defult 會自動判別取用數值，在需要有判別和指定數值的情況下，可以使用 self 作區別。*/

/*
## Part 2: Enumerations and Optionals in Swift
1. There are several gasoline types, 92, 95, 98, and diesel that we can use enum to model them.
● Please declare an enum named Gasoline to model gasoline.
● Every kind of gasoline has its price. Please declare a computed property named price and a method named getPrice separately in Gasoline enum that both will return different prices depending on different gasoline.
● Please establish raw values for . The data type of raw value should be String. For example, should be “92”.
● Please explain what enum associated value is and how it works. */

//定義各汽油的 String 與價格
enum Gasoline: String {
    case gasoline92 = "92"
    case gasoline95 = "95"
    case gasoline98 = "98"
    case diesel = "diesel"
    
    var price: Double {
        switch self {
        case .gasoline92: return 31.6
        case .gasoline95: return 33.1
        case .gasoline98: return 35.1
        case .diesel: return 29.1
        }
    }
    func getPrice() -> Double {
         return self.price
     }
}

/* enum associated value
 enum 當中可以使用 associated value 來存取一些需要定義、提供判斷的數據或資訊，可以搭配 switch 或 optional 等其他語法使用。*/
/*
 ## 2. Optional is a very special data type in Swift. Take var a: Int? = 10 for example, the
 value of a will be nil or Int . You should have learned how to deal with Optional.
 ● People would like to have pets, but not everyone could have one. Declare a class Pet with name property and a class People with pet property which will store a Pet instance or nil. Please try to figure out what data type is suitable for these properties in Pet and People.
 ● Please create a People instance. Use guard let to unwrap the pet property and print its name.
 ● Please create another People instance. Use if let to unwrap the pet property and print its name.
 */

class Pet {
    var name: String?
    
    init(name: String?) {
        self.name = name
    }
}
class People {
    var pet: Pet?
}

//guard let
let personA = People()
let personB = People()
personB.pet = Pet(name: "Meow")

func printPetNameWithGuardLet(_ person: People) {
    guard let petName = person.pet?.name else {
        print("Don't have pet")
        return
    }
    print("Pet name is \(petName)")
}

//if let
func printPetNameWithIfLet(_ person: People) {
    if let petName = person.pet?.name {
        print("Pet name is \(petName)")
    } else {
        print("Don't have pet")
    }
}
//測試
printPetNameWithGuardLet(personA)
printPetNameWithIfLet(personB)

/*
 ## Part 3: Protocol in Swift
 1. Declare a struct Person with a name property type String and a protocol name PoliceMan . There is only one method arrestCriminals with no argument.
 */
struct Person {
    var name: String
}
protocol PoliceMan {
    func arrestCriminals()
}

//2. Make struct Person conform to PoliceMan protocol.
extension Person:PoliceMan {
    func arrestCriminals() {
        print("\(name) arrests criminals")
    }
}
//3. Declare a protocol ToolMan with a method fixComputer that has no argument and return void.
protocol ToolMan {
    func fixComputer()
}

//4. Add a property toolMan to the struct Person with data type ToolMan .
extension Person {
    var toolMan: ToolMan {
        return Engineer()
    }
}
//5. Declare a struct named Engineer that conforms to the ToolMan protocol.
struct Engineer: ToolMan {
    func fixComputer() {
        print("fixing computer")
    }
}

//6. Create a Person instance with the name “Steven” and also create the relative data you need to declare this instance.
let steven = Person(name: "Steven")
steven.arrestCriminals()
steven.toolMan.fixComputer()

/*
 ## Part 4: Error Handling in Swift
 enum GuessNumberGameError {
     case wrongNumber
 }
 class GuessNumberGame {
     var targetNumber = 10
     func guess(number: Int) throws {
         guard number == targetNumber else {
             throw GuessNumberGameError.wrongNumber
         }
         print("Guess the right number: \(targetNumber)")
     }
 }
 Read the code above first and paste it in the playground file, there is an error inside the code.
 Please solve the error by adding a piece of code in the file. Call guess(number:) and pass 20 as the argument after you fix the problem.
 */

//增改關於猜錯數字的回應，原本只有寫猜對數字的部分。
enum GuessNumberGameError: Error {
    case wrongNumber
}
class GuessNumberGame {
    var targetNumber = 10
    func guess(number: Int) throws {
        guard number == targetNumber else {
            throw GuessNumberGameError.wrongNumber
        }
        print("Guess the right number：\(targetNumber)")
    }
}
let game = GuessNumberGame()
do {
    try game.guess(number: 20)
} catch GuessNumberGameError.wrongNumber {
    print("Guess wrong !")
}

