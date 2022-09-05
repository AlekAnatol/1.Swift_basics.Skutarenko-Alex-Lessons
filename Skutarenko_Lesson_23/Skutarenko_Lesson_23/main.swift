//
//  main.swift
//  Skutarenko_Lesson_23
//
//  Created by Екатерина Алексеева on 03.02.2022.
//

import Foundation

//class Symbol {
//}
//
//class A: Symbol {
//    func aa(){
//    }
//}
//
//class B: Symbol {
//    func bb(){
//    }
//}
//
//var aCount = 0
//var bCount = 0
//var sCount = 0
//
//let array: [Symbol] = [A(), B(), Symbol(), A(), A(), B()]
//
//for value in array {
//    if value is A {
//        aCount += 1
//    } else if value is B {
//        bCount += 1
//    } else if value is Symbol {
//        sCount += 1
//    }
//
////    if let a = value as? A {
////        a.aa()
////        print("a")
////    } else if let b = value as? B {
////        b.bb()
////        print("b")
////    } else if let s = value as? Symbol {
////        //b.bb()
////        print("s")
////    }
//
//}
//
//print(aCount)
//print(bCount)
//print(sCount)


/*
 1. Сделать класс Человек, у этого класса будут проперти Папа, Мама, Братья, Сестры (всё опционально).
 Сделать примерно 30 человек, взять одного из них, поставить ему Папу/Маму. Папе и Маме поставить Пап/Мам/Братьев/Сестер. Получится большое дерево иерархии.
 Посчитать, сколько у этого человека двоюродных Братьев, троюродных Сестёр, Теть, Дядь, итд*/
 
class Human {
    static var allFamilly: [Human] = []
    //static var count = 0
    
    let name: String
    var father: Human? = nil
    var mother: Human? = nil
    var brothers: [Human]? = nil
    var sisters: [Human]? = nil
    
    init(_ name: String) {
        self.name = name
        Human.allFamilly.append(self)
//        Human.count += 1
//        print (Human.count)
    }
    
    func findCuzines() {
        var grandParrentsNames = [String]()
        
        if let grandMumName1 = self.mother?.mother?.name {
            grandParrentsNames.append(grandMumName1)
        }
        
        if let grandMumName2 = self.father?.mother?.name {
            grandParrentsNames.append(grandMumName2)
        }
        
        if let grandPaName1 = self.mother?.father?.name {
            grandParrentsNames.append(grandPaName1)
        }
        
        if let grandPaName2 = self.father?.father?.name {
            grandParrentsNames.append(grandPaName2)
        }
        
        print(grandParrentsNames)
        
        var cuzines = [Human]()
        
        for value in Human.allFamilly {
            guard self.mother?.name != value.mother?.name else {continue}
            
            if let grandMumName = value.mother?.mother?.name {
                if grandParrentsNames.contains(grandMumName) {
                    cuzines.append(value)
                }
                
            } else if let grandMumName = value.father?.mother?.name {
                if grandParrentsNames.contains(grandMumName) {
                    cuzines.append(value)
                }
                
            } else if let grandPaName = value.mother?.father?.name {
                if grandParrentsNames.contains(grandPaName) {
                    cuzines.append(value)
                }
            } else if let grandPaName = value.father?.father?.name {
                if grandParrentsNames.contains(grandPaName) {
                    cuzines.append(value)
                }
            }
            
        }
        
        if cuzines.count == 0 {
            print("No cuzines")
        } else {
            print("\(self.name) has \(cuzines.count) cuzines")
//            print("Cuzines for \(self.name):")
//            for value in cuzines {
//                print(value.name)
//            }
        }
    }
    
    func findUncles() -> [Human] {
        var unclesPossibly = [Human]()
        if let mothersUncles = self.mother?.brothers {
            for value in mothersUncles {
                unclesPossibly.append(value)
            }
        }
        if let fatherUncles = self.father?.brothers {
            for value in fatherUncles {
                unclesPossibly.append(value)
            }
        }
        
        if unclesPossibly.count == 0 {
            print("No uncles")
        } else {
            print("Uncles for \(self.name):")
            for value in unclesPossibly {
                print(value.name)
            }
        }
        return unclesPossibly
    }
    
    func findAunts() -> [Human] {
        var auntsPossibly = [Human]()
        if let mothersAunts = self.mother?.sisters {
            for value in mothersAunts {
                auntsPossibly.append(value)
            }
        }
        if let fatherAunts = self.father?.brothers {
            for value in fatherAunts {
                auntsPossibly.append(value)
            }
        }
        
        if auntsPossibly.count == 0 {
            print("No aunts")
        } else {
            print("Aunts for \(self.name):")
            for value in auntsPossibly {
                print(value.name)
            }
        }
        return auntsPossibly
    }
    
    
    func printAllFamilly() {
        for value in Human.allFamilly {
            print(value.name)
        }
    }
}

var prababushkaMum = Human("Maria Egorovna")
var pradedushkaMum = Human("Jakov")
var babushkaMum = Human("Maria Jakovlevna")
var dedushkaMum = Human("Arkadij")
var mum = Human("Raisa")
var dad = Human("Anatoliy")
var d1 = Human("Oleg")
//var d1j = Human("Jenina = dev")
var t1 = Human("Sveta")
var t2 = Human("Luda")
var t3 = Human("Nadia")
var d2 = Human("Arkasha")
var s1 = Human("Olga")
var s2 = Human("Olesia")
var b1 = Human("Artur")
var s3 = Human("Jenia")
var s4 = Human("Angela")
var s5 = Human("Kristina")
var b2 = Human("Sergey")
var b3 = Human("Stas")
var s6 = Human("Katya")
var s7 = Human("Irina")
var s8 = Human("Vika")
var b4 = Human("Lesha")
var ch1 = Human("Arurovich1 = mal")
var ch2 = Human("Arurovich2 = mal")
var ch3 = Human("Olgina1 = dev")
var ch4 = Human("Olgina2 = dev")
var ch5 = Human("Olgina3 = mal")
var ch6 = Human("Olesina1 = dev")
var ch7 = Human("Kristinina = dev")
var ch8 = Human("Kristinina = dev")
var ch9 = Human("Jenina = dev")
var ch10 = Human("Jenina = mal")

babushkaMum.mother = prababushkaMum
babushkaMum.father = pradedushkaMum

mum.mother = babushkaMum
mum.father = dedushkaMum
mum.brothers = [d1, d2]
mum.sisters = [t1, t2, t3]

d1.mother = babushkaMum
d1.father = dedushkaMum
d1.brothers = [d2]
d1.sisters = [t1, t2, t3, mum]

d2.mother = babushkaMum
d2.father = dedushkaMum
d2.brothers = [d1]
d2.sisters = [t1, t2, t3, mum]

t1.mother = babushkaMum
t1.father = dedushkaMum
t1.brothers = [d1, d2]
t1.sisters = [t2, t3, mum]

t2.mother = babushkaMum
t2.father = dedushkaMum
t2.brothers = [d1, d2]
t2.sisters = [t1, t3, mum]

t3.mother = babushkaMum
t3.father = dedushkaMum
t3.brothers = [d1, d2]
t3.sisters = [t1, t2, mum]

s1.father = d1
s1.brothers = [b1]
s1.sisters = [s2]

s2.father = d1
s2.brothers = [b1]
s2.sisters = [s1]

b1.father = d1
//b1.brothers = [b1]
b1.sisters = [s1, s2]

s3.mother = t2
s3.sisters = [s4, s5]

s4.mother = t2
s4.sisters = [s4, s5]

s5.mother = t2
s5.sisters = [s4, s3]

b2.mother = t1
b2.brothers = [b2]

b3.mother = t1
b3.brothers = [b2]

s6.mother = mum
s6.father = dad
s6.sisters = [s7]

s7.mother = mum
s7.father = dad
s7.sisters = [s6]

s8.mother = t3
s8.brothers = [b4]

b4.mother = t3
b4.sisters = [s8]


//s7.findUncles()
s1.findUncles()
s7.findAunts()
s7.findCuzines()
