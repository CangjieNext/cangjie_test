/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

class Allman
{
    let tag: Int64 = 1
    public init()
    {
    }
    public func get(): Int64
    {
        return tag
    }
}

struct Point
{
    Point(let x: Int64, let y: Int64)
    {
    }
}

enum Color
{
    | Red | Green | Blue
}

interface Shape
{
    func area(): Int64
}

class Rect <: Shape
{
    public func area(): Int64
    {
        return 4
    }
}

main()
{
    println(Allman().get())
    println(Point(1, 2).x)
    println(Rect().area())
}
