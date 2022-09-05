//
//  main.swift
//  Skutarenko_Lesson_25
//
//  Created by Екатерина Алексеева on 14.02.2022.
//

import Foundation

/* 1. Расширьте енум из урока и добавьте в него метод, помогающий установить соответствующий бит в переданную маску и метод, помогающий его прочитать. Эти методы должны принимать и возвращать маску, либо принимать адрес маски и менять его
 */

extension UInt8 {
    
    func binary() -> String {
        var result = ""
        for i in 0...7 {
            let mask = 1 << i
            let set = Int(self) & mask != 0
            result = (set ? "1" : "0") + result
        }
        return result
    }
    
    func eightLeft() {
        for i in 0...7 {
                print((self << i).binary())
        }
        (self << 7).eightRight()
    }
    
    func eightRight() {
        for i in 0...7 {
                print((self >> i).binary())
        }
       // self.eightLeft()
    }
}

/*
enum CheckList: UInt8 {
    case Bread =    0b00000001
    case Chicken =  0b00000010
    case Apples =   0b00000100
    case Pears =    0b00001000
}

extension CheckList {
    func addPoint (checkList: UInt8) -> (UInt8) {
        //print(checkList.binary())
        print("\(self) added")
        return checkList | self.rawValue //UInt8(1)
    }
    
    func isAdded(checkList: UInt8) -> Bool {
        let result = checkList & self.rawValue
        result > 0 ? print("\(self) added") : print("\(self) not added")
        return result > 0 ? true : false
    }
}



var checkList: UInt8 = 0b00001001
checkList = CheckList.Apples.addPoint(checkList: checkList)
print(checkList.binary())

//checkList = CheckList.Chicken.addPoint(checkList: checkList)
//print(checkList.binary())

print(CheckList.Chicken.isAdded(checkList: checkList))
print(CheckList.Bread.isAdded(checkList: checkList))
print(CheckList.Apples.isAdded(checkList: checkList))
print(CheckList.Pears.isAdded(checkList: checkList))
*/

/*2. Создать цикл, который будет выводить 1 байтное число с одним установленным битом в такой последовательности, чтобы в консоли получилась вертикальная синусоида
*/


let a : UInt8 = 1
//print(a.binary())
for _ in 1...3 {
    a.eightLeft()
}
