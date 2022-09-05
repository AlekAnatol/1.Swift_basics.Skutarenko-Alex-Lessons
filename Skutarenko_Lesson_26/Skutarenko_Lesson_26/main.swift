//
//  main.swift
//  Skutarenko_Lesson_26
//
//  Created by Екатерина Алексеева on 14.02.2022.
//

import Foundation

struct Point {
    var x: Int
    var y: Int
}

let p1 = Point(x: 2, y: 3)
let p2 = Point(x: 3, y: 5)

func + (a: Point, b: Point) -> Point {
    return Point(x: a.x + b.x, y: a.y + b.y)
}

print(p1 + p2)
