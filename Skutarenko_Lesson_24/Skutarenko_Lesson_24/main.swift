//
//  main.swift
//  Skutarenko_Lesson_24
//
//  Created by Екатерина Алексеева on 09.02.2022.
//

import Foundation


//extension Int {
//    var isEven: Bool {
//        return self % 2 == 0
//    }
//
//    var isOdd: Bool {
//        return !isEven
//    }
//
//    enum EvenOrOdd {
//        case even
//        case odd
//    }
//
//    var evenOrOdd: EvenOrOdd {
//        return isEven ? .even : .odd
//    }
//}
//
//
//let a = 5
//
//if a % 2 != 0 {
//    print ("fgh")
//}
//
//
//if a.isOdd {
//    print("gh")
//}

//print(a.evenOrOdd)


//1. Создайте расширение для Int с пропертисами isNegative, isPositive, bool
//2. Добавьте проперти, которое возвращает количество символов в числе
//3. Добавьте сабскрипт, который возвращает символ числа по индексу:
//  let a = 8245
//  a[1] // 4
//  a[3] // 8
//Профи могут определить и сеттер :)

extension Int {
    var isNegative: Bool {
        return self < 0
    }
 
    var isPositive: Bool {
        return self > 0
    }

    var bool: Bool {
        return self != 0
    }
    
    var numberOfCharacters: Int {
        let stringNumber = String(self)
        return stringNumber.count
    }
    
    subscript(index: Int) -> Int? {
        get {
            
            let stringNumber = String(self)
            
            if index > stringNumber.count - 1 {
                print("Цифры под таким номером нет")
                return nil
                
            } else {
                let reversedStringNumber = String(stringNumber.reversed())
                let firstIndex = reversedStringNumber.startIndex
                let currentIndex = reversedStringNumber.index(firstIndex, offsetBy: index)
                return Int(String(reversedStringNumber[currentIndex]))
            }
        }
        
        set {
            let value = Character(String(newValue!))
            var stringNumber = String(self)
            var reversedStringNumber = String(stringNumber.reversed())
            let firstIndex = reversedStringNumber.startIndex
            
            
            if index > stringNumber.count - 1 {
                print("Цифры под таким номером нет, значение числа не поменялось")
                
            } else {
                let currentIndex = reversedStringNumber.index(firstIndex, offsetBy: index)
                
                reversedStringNumber.remove(at: currentIndex)
                reversedStringNumber.insert(value, at: currentIndex)
                stringNumber = String(reversedStringNumber.reversed())
            }
            self = Int(stringNumber)!
        }
    }
}

var a = 123456

//print(a.bool)
//print(a.isNegative)
//print(a.isPositive)
//print(a.numberOfCharacters)
//print(a[7])
//a[7] = 6
//print(a)
//a[0] = 9
//print(a)
//a[4] = 7
//print(a)
//a[8] = 1
//print(a)
//a[7] = 1
//print(a)


//4. Расширить String, чтобы принимал сабскрипт вида s[0..<3] и мог также устанавливать значения используя его
//
//5. Добавить стрингу метод truncate, чтобы отрезал лишние символы и , если таковые были, заменял их на троеточие:
//let s = "Hi hi hi"
//s.truncate(4) // Hi h...
//s.truncate(10) // Hi hi hi

extension String {
    subscript (range: Range<Int>) -> String {
        get {
        let (start, end) = getRange(range: range)
        return String(self[start...end])
    }
        
        set {
            for indexCount in 0...range.count {
                let currentIndexOld = self.index(self.startIndex, offsetBy: indexCount+range.first!)
                let currentIndexNew = newValue.index(newValue.startIndex, offsetBy: indexCount)
                self.remove(at: currentIndexOld)
                self.insert(newValue[currentIndexNew], at: currentIndexOld)
            }
        }
    }
    
    mutating func truncate(_ numberOfCharacters: Int) {
        if self.count < numberOfCharacters {
            print("Заданное число находится за диапазоном строки")
            return
            
        } else {
            let removeNumber = self.count - numberOfCharacters
            self.removeLast(removeNumber)
            self.append("...")
        }
    }
    
    
    func getRange(range: Range<Int>) -> (start: String.Index, end: String.Index) {
        let firstIndexRange = range.first!
        let lastIndexRange = range.last!
        
        if lastIndexRange > self.count {
            print("Указан некорректный диапазон")
            return (self.startIndex, self.startIndex)
            
        } else {
            let start = self.index(self.startIndex, offsetBy: firstIndexRange)
            let end = self.index(self.startIndex, offsetBy: lastIndexRange)
            
            return(start, end)
        }
    }
}

var str = "fghjhjkmlkd"
print(str[3..<4])
str[4..<6] = "LILUK"
print(str)
str.truncate(12)
print(str)
str.truncate(5)
print(str)












