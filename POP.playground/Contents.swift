/*:
 Los vehículos pueden tener diferentes propiedades y funciones.

 Todos los vehiculos:
    - Tienen una velocidad a la que se mueven
    - Calcular el tiempo que tardarán en recorrer una distancia determinada

 Todos los vehículos excepto una motocicleta y un buque:
    - Tienen una cantidad de Windows

 Sólo vehículos terrestres:
    - Tienen una cantidad de ruedas

 Sólo Autobuses:
    - Tienen una capacidad de asientos

 Sólo Embarcaciones:
    - Tienen una longitud

 Crea los siguientes tipos de vehículos: automóvil, autobús, portacontenedores, barco, motocicleta

 ----

 La solución a continuación no usa protocolos, se basa únicamente en subclases. ¿Puedes refactorizar este código para que utilice protocolos?
*/

typealias KilometersPerHour = Double
typealias Kilometers = Double
typealias Hours = Double

class Vehicle {
  
  var speed: KilometersPerHour = 0
  
  func travelDuration(distance: Kilometers) -> Hours {
    return distance / speed
  }
  
}

class GroundVehicle: Vehicle {
  
  var wheels: Int = 0
}

class Car: GroundVehicle {
  
  var amountOfWindows: Int = 0
}

class MotorCycle: GroundVehicle {
  
}

class Bus: GroundVehicle {
  
  var capacity: Int = 0
  var amountOfWindows: Int = 0
}

class Vessel: Vehicle {
  
  var length: Int = 0
}

class Boat: Vessel {
  
  var amountOfWindows: Int = 0
}

class ContainerShip: Vessel {
  
}

var car = Car()
car.amountOfWindows = 6
car.speed = 120

var bus = Bus()
bus.amountOfWindows = 20
bus.speed = 100

var boat = Boat()
boat.amountOfWindows = 8
boat.speed = 30

var containerShip = ContainerShip()
containerShip.speed = 30

var motorcycle = MotorCycle()
motorcycle.speed = 130

let vehicles = [car, bus, boat, containerShip, motorcycle]

for vehicle in vehicles {
    var amountOfWindowsSubstring = ""
    
    if let boat = vehicle as? Boat {
        amountOfWindowsSubstring = " has \(boat.amountOfWindows) windows and"
    } else if let car = vehicle as? Car {
        amountOfWindowsSubstring = " has \(car.amountOfWindows) windows and"
    } else if let bus = vehicle as? Bus {
        amountOfWindowsSubstring = " has \(bus.amountOfWindows) windows and"
    }

  
    print("\(type(of: vehicle)) \(amountOfWindowsSubstring) needs \(vehicle.travelDuration(distance: 100)) to travel 100 kilometers.")
}
