//
//  main.swift
//  Skutarenko_Lesson_19
//
//  Created by Екатерина Алексеева on 31.01.2022.
//

import Foundation

class Student1 {
    var firstName: String
    var secondName: String
    var fullName: String {
        return firstName + " " + secondName
    }
    
    init() {
        self.firstName = ""
        self.secondName = ""
    }
}

class Student2 {
    var firstName: String = ""
    var secondName: String = ""
}

class Student3 {
    var firstName: String
    var secondName: String
    
    init(firstName: String, secondName: String) {
        self.firstName = firstName
        self.secondName = secondName
    }
}

class Student4 {
    var middleName: String?
}

class Student5 {
    let maxAge: Int
    
    init(){
        maxAge = 100
    }
}

//class Student6: Student5 {
//    override init() {
//        maxAge = 110
//    }
//}

let s1 = Student1()
let s2 = Student2()
let s3 = Student3(firstName: "a", secondName: "b")

print(s1.secondName)
print(s2)

////////////////

class Human {
    var weight: Int
    var age: Int
    
    init(weight: Int, age: Int) {
        self.weight = weight
        self.age = age
    }
    
    convenience init (age: Int) {
        self.init(weight: 0, age: age)
    }
    
    convenience init (weight: Int) {
        self.init(weight: weight, age: 0)
    }
    
    convenience init () {
        self.init(weight: 0)
    }
    
    func test() {}
}

let h1 = Human(weight: 70, age: 25)
let h2 = Human()

class Student: Human {
    var firstName: String
    var secondName: String
    
    init(firstName: String, secondName: String) {
        self.firstName = firstName
        self.secondName = secondName
        super.init(weight: 0, age: 0)
        self.weight = 50
    }
    
    convenience init(firstName: String) {
        self.init(firstName: firstName, secondName: "")
        self.age = 28
        test()
    }
}

class Doctor: Student {
    var fieldOfStydy: String = ""
    
//    init(fieldOfStydy: String) {
//        self.fieldOfStydy = fieldOfStydy
//        super.init(firstName: "doctor", secondName: "House")
//    }
}

var d1 = Doctor(firstName: "aa", secondName: "" )
