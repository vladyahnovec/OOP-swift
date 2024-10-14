import UIKit

// Инкапсуляция
/*Сокрытие внутренних данных компонента и деталей его реализации от других компонентов приложения и предоставление набора методов для взаимодействия с ним(API). Инкапсуляция реализуется с помощью модификаторов доступа(public, private)*/
class Car {
    public var weight : Int = 0
    private var maxSpeed : Int = 0
    
    func getMaxSpeed() -> Int {
        return self.maxSpeed
    }
    func setMaxSpeed(mSpeed: Int) {
        self.maxSpeed = mSpeed
    }
}

var firstCar = Car()
print(firstCar.weight, firstCar.getMaxSpeed())
firstCar.setMaxSpeed(mSpeed: 100)
firstCar.weight = 100
print(firstCar.weight, firstCar.getMaxSpeed())

//Наследование
/*Позволяет описать новый класс на основе существующего (родительского). При этом свойства и методы родительского класса взаимствует новый класс.*/
class Person {
    var name: String
    var age: Int
    var weight: Double
    
    init(name: String, age: Int, weight: Double) {
        self.name = name
        self.age = age
        self.weight = weight
    }
    
    func greeting() {
        print("Привет, я человек, меня зовут \(self.name) мне \(self.age) лет и мой вес \(self.weight)кг.")
    }
}

class Teacher: Person {
    var experience: Int

    init(name: String, age: Int, weight: Double, experience: Int) {
        self.experience = experience
        super.init(name: name, age: age, weight: weight)
    }
    
    
    override func greeting() {
        print("Привет, я учитель, меня зовут \(self.name) мне \(self.age) лет,  мой вес \(self.weight)кг, мой стаж \(self.experience)лет.")
    }
}

var firstPerson = Person(name: "Vlad", age: 19, weight: 70)
var firstTeacher = Teacher(name: "Svetlana", age: 45, weight: 75, experience: 25)
firstPerson.greeting()
firstTeacher.greeting()


//Полиморфизм
/*Позволяет разным объектам выполнять одни и те же действия. При этом неважно как эти типы устроены внутри и чем они различаются.*/

class Animal {
    var name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    func greeting() {
        print("*Звук животного*")
    }
}

class Cat : Animal {
    override init(name: String, age: Int) {
        super.init(name: name, age: age)
    }
    
    override func greeting() {
        print("Мяу - мяу!")
    }
}

class Dog : Animal {
    var breed: String
    init(name: String, age: Int, breed: String) {
        self.breed = breed
        super.init(name: name, age: age)
    }
    
    override func greeting() {
        print("Гав - гав!")
    }
}

var firstAnimal = Animal(name: "Animal", age: 10)
firstAnimal.greeting()

var firstCat = Cat(name: "Tom", age: 10)
firstCat.greeting()

var firstDog = Dog(name: "Jarry", age: 12, breed: "poodle")
firstDog.greeting()

//Композиция
/*Когда объект одного класса инициализируется в конструкторе другого класса. При удалении */

class Bullet {
    var caliber: String
    init(caliber: String) {
        self.caliber = caliber
    }
}

class Gun {
    var name: String
    var speed: Int
    var bullet: Bullet = Bullet(caliber: "5.45mm")
    init(name: String, speed: Int) {
        self.name = name
        self.speed = speed
    }
}

var firstGun = Gun(name: "AK", speed: 200)
print(firstGun.bullet.caliber)

//Агрегация
/*Когда объект передается в класс в качестве параметра извне.*/

class Owner {
    var name: String
    init(name: String) {
        self.name = name
    }
}

class Bike {
    var model: String
    var owner: Owner
    init(model: String, owner: Owner) {
        self.model = model
        self.owner = owner
    }
}

var owner = Owner(name: "Vlad")
var bike = Bike(model: "Aist", owner: owner)
print(bike.owner.name)

//Протокол
/*Шаблон методов / свойств по которым затем могут быть созданы классы, структуры и enum*/
protocol Apartament {
    var address: String { get } // можно получать свойство
    var numberOfRooms: Int { get set} // можно получать и изменять
    
    func displayInfo()
}

class OneBedroomApartament: Apartament {
    var address: String
    
    var numberOfRooms: Int
    
    init(address: String, numberOfRooms: Int) {
        self.address = address
        self.numberOfRooms = numberOfRooms
    }
    
    func displayInfo() {
        print(self.address, self.numberOfRooms)
    }
}

var oneBedroom = OneBedroomApartament(address: "Oktyabrskaya", numberOfRooms: 1)
oneBedroom.displayInfo()
