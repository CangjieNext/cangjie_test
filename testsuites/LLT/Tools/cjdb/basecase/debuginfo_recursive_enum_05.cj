// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

main():Int64 {
    var z = b() // fix needed in cjdb
    var z0 = b1()
    var z1 = b2() // fix needed in cjdb
    var y = e.d(b()) // fix needed in cjdb
    var x0 = e.c
    var x1 = e1.c
    return 0;
}

var a : (Float32,Enum8) = (-19.0, Enum8.defaultValue);

enum Enum8{
    defaultValue |
    enumValue183 ((Float32,Enum8))
}

// nested tuple/array type
struct b { 
    let a = (2, e.c)
    let b = [e.c]
}
enum e { c | d(b) }
struct b1 { let a: (Int64, Option<Int64>) = (2, None)}
enum e1 { c | d(Object)}
struct b2 { let a = (2, e1.c)}
