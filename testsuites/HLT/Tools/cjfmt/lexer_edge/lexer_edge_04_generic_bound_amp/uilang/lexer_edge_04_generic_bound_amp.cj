/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

interface Showable {
    func show(): String
}

interface Countable {
    func count(): Int64
}

func describe<T>(v: T): String where T <: Showable&Countable {
    return "${v.show()}:${v.count()}"
}

class Box <: Showable&Countable {
    let n=3
    public func show(): String {
        return "box"
    }
    public func count(): Int64 {
        return n
    }
}

func andBits(a: Int64, b: Int64): Int64 {
    return a&b|a^b
}

main() {
    println(describe(Box())+"|"+andBits(6,3).toString())
}
