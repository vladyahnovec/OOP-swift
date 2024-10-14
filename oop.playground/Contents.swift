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
