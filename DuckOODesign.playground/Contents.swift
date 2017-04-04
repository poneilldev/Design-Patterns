
//***************************************************
//
//
// DESIGN PATTERNS: PROGRAM TO AN INTERFACE (PROTOCOL)
//
//
//***************************************************
import UIKit

protocol FlyBehavior {
    func fly()
}

protocol QuackBehavior {
    func quack()
}


class Duck {
    var flyBehavior: FlyBehavior? = nil
    var quackBehavior: QuackBehavior? = nil
    
    func display() {
        preconditionFailure("This method must be overridden")
    }
    
    func performFly() {
        flyBehavior?.fly()
    }
    
    func performQuack() {
        quackBehavior?.quack()
    }
    
    func swim() {
        print("All ducks can swim")
    }
}


//***************************************************
// Custom Flying Behaviors
//***************************************************
class FlyWithWings: FlyBehavior {
    func fly() {
        print("I can fly!")
    }
}

class FlyNoWay: FlyBehavior {
    func fly() {
        print("No flying for me...")
    }
}


//***************************************************
// Custom Quack Behaviors
//***************************************************
class Quack: QuackBehavior {
    func quack() {
        print("QUACK QUACK!")
    }
}

class Squeak: QuackBehavior {
    func quack() {
        print("SQUEAK SQUEAK!")
    }
}

class MuteSqueak: QuackBehavior {
    func quack() {
        print("Mute quacking...")
    }
}

//***************************************************
// Custom Duck Classes
//***************************************************
class Mallard: Duck {
    
     override init() {
        super.init()
        
        self.flyBehavior = FlyWithWings()
        self.quackBehavior = Quack()
    }
    override func display() {
        print("I am a Mallard")
    }
}

class Eider: Duck {
    
    override init() {
        super.init()
        self.flyBehavior = FlyWithWings()
        self.quackBehavior = Quack()
    }
    override func display() {
        print("I am a Eider")
    }
}

class RubberDuck: Duck {
    
    override init() {
        super.init()
        self.flyBehavior = FlyNoWay()
        self.quackBehavior = Squeak()
    }
    override func display() {
        print("I am a Rubber duck")
    }
}




let mallord = Mallard()

mallord.performQuack()
mallord.performFly()

let eider = Eider()
eider.performFly()
eider.performQuack()

let rubberDucky = RubberDuck()
rubberDucky.performFly()
rubberDucky.performQuack()
rubberDucky.swim()


