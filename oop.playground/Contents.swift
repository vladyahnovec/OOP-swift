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
