//
//  main.swift
//  Skutarenko_Lesson_22
//
//  Created by Екатерина Алексеева on 02.02.2022.
//
import Foundation

/* var playground = true

class Teacher {
    var student: Student?
    
    deinit {
        print("Goodbye teacher")
    }
}


class Student {
    weak var teacher: Teacher?
    
    deinit {
        print("Goodbye student")
    }
}


if playground {
    var teacher = Teacher()
    
    if playground {
        var student = Student()
        teacher.student = student
        student.teacher = teacher
    }
    print("Exit playground")
}
print("End")
 */

/*
 Рассмотрим такую ситуацию: есть семья - папа, мама и дети.
 Папа глава семьи, у него есть Мама, Мама контролирует детей, т.е. иерархия: Папа - Мама - Дети, Дети на одном уровне.
 Дети могут вызывать друг друга и они могут искать пути, как общаться с другими Детьми, например говорить "дай игрушку", спрашивать Маму: "Мама, дай конфетку", общаться с Папой: "Папа, купи игрушку".
 Вся эта иерархия лежит в объекте класса Семья, у которого есть методы, например распечатать всю Семью, т.е. метод вернёт массив всех членов Семьи.
 У Папы есть 3 кложера (closures) - 1. когда он обращается к Семье - распечатать всю Семью, 2. распечатать Маму, 3. распечатать всех Детей.
 Создать всю иерархию со связями. При выходе из зоны видимости все объекты должны быть уничтожены.
 */


class Familly {
    var dad: Dad?
    var mum: Mum?
    var children: [Child]?
    
    func getAllFamilly ()-> [Human] {
        var allFamilly = [Human]()
        allFamilly.append(dad!)
        allFamilly.append(mum!)
        for child in children! {
            allFamilly.append(child)
        }
        return allFamilly
    }
    
    deinit {
        print("Familly deinit")
    }
}

class Human {
    
}

class Dad: Human {
    var mum: Mum?
    var children: [Child]?
    
    lazy var talkToFamilly: ()->() = {[weak self] in
        var allFamilly = [Human]()
        allFamilly.append(self!)
        allFamilly.append(self!.mum!)
        for child in self!.children! {
            allFamilly.append(child)
        }
        print(allFamilly)
    }
    
    lazy var talkToMum: ()->() = {[weak self] in
        print (self!.mum ?? "no mum")
    }
    
    lazy var talkToChildren: ()->() = {[weak self] in
        print (self!.children ?? "no child")
    }
    
    deinit {
        print("Dad deinit")
    }
}

class Mum: Human {
    weak var dad: Dad?
    var children: [Child]?
    
    deinit {
        print("Mum deinit")
    }
}

class Child: Human {
    var name: String = "child"
    weak var dad: Dad?
    weak var mum: Mum?
    weak var sister: Child?
    
    
    lazy var giveMeToy: (Child)->()  =  {[unowned self] (_ child: Child)->() in
        print("\(self.name) says: 'Give me this toy, \(child.name)'")
    }
    
    lazy var giveMeCandy: (Mum)->()  =  {[unowned self] _ in
        print("\(self.name) says: 'Mum, give me a candy'")
    }
    
//    lazy var buyToy: (Dad)->()  =  {[unowned self] _ in
//        print("\(self.name) says: 'Dad, buy me a toy'")
//    }
    var buyToy: (Dad)->()  =  { _ in
        print("Dad, buy me a toy")
    }
    
    deinit {
        print("\(self.name) deinit")
    }
}


let playground = true
if playground {
    let familly = Familly()
    let dad = Dad()
    let mum = Mum()
    let child1 = Child()
    let child2 = Child()
    var children = [Child]()
    children.append(child1)
    children.append(child2)
    
    dad.mum = mum
    dad.children = children
    
    mum.dad = dad
    mum.children = children
    
    child1.name = "Andrew"
    child1.mum = mum
    child1.dad = dad
    child1.sister = child2
    
    child2.name = "Bob"
    child2.mum = mum
    child2.dad = dad
    child2.sister = child1
    
    familly.dad = dad
    familly.mum = mum
    familly.children = children
    
    
    child1.giveMeToy(child2)
    child2.giveMeCandy(child2.mum!)
    child2.buyToy(dad)
    //child2.giveMeToy(child1)
    //child1.giveMeToy()
    
   // print(familly.getAllFamilly())
    dad.talkToFamilly()
    dad.talkToMum()
    dad.talkToChildren()
    
    print("Exit playground")

}

print("End")
