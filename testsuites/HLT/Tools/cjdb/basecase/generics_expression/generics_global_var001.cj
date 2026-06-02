/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.collection.*

struct structtype01<T> {
    var a: T
    public init(x: T) {
        a = x
    }
}

public class classtype01<T> {
    var a: T
    public init(x: T) {
        a = x
    }
}

var vrange: Range<Int64> = 1..10:3
var vcarrc2: Array<Int64> = [2]
var vlist2 = ArrayList<Int64>([1, 2])
public var vhmc: HashMap<String, Bool> = HashMap<String, Bool>([("a", true)])
var vst = structtype01<Float32>(1.0)
private var vctc = classtype01<Int64>(10)

main(): Int64 {
    println("hello world")
    return 0
}
