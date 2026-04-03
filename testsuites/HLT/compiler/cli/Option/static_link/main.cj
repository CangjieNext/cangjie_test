/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// core
import std.core.*
// normal std
import std.collection.*
// User's libraries.
import my_utils.*
// stdx libraries.
import stdx.encoding.json.*

public func stdCore(): Unit {
    let a = Array<Int64>()
}

public func stdCollection(): Unit {
    let a = ArrayList<Int64>()
}

public func myUtils(): Unit {
    let c = C()
}

public func json(): Unit {
    let v = JsonValue.fromStr("{}")
}

main(): Unit {
    stdCore()
    stdCollection()
    myUtils()
    json()
}
