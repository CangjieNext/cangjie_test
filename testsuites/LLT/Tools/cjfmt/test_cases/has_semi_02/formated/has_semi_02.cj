// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

main(): Int64 {
    var i: Int16 = 2
    var akDDD: Int16 = 3
    var c = i + akDDD;
    c = c + 1
    println("hello world")
    println("hello world")
    println(i)
    println(akDDD)
    if (i >= akDDD) {
        println("i >=akDDD")
    } else {
        return 0
    }
    var b: Int16 = 13
    println(b)
    var bd: Int16 = 13
    bd = 1 + bd
    println("just try try-------------------${bd}")
    return 0
};

abstract class testdd {
    public static func name() {
    }

    private static func name3() {
    }
}
