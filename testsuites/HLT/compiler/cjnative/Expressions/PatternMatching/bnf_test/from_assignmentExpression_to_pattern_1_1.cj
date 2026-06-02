/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

class Boo {
    public var a: String = ""
    public func foo(x: Int64) {
        var b = match (a) {
            case "s" => 1
            case "" => 2
            case _ => 3
        }
        return x.toString() + a + b.toString()
    }
    public var b = match (a) {
        case "s" => 1
        case "" => 2
        case _ => 3
    }
    public init(x!: String = match ("") {
            case _ => "b"
        }) {
        a = x
    }
    public Boo(y: Int64, x!: String = match ("") {
            case _ => "b"
        }) {
        b = y
    }
}

main(): Int64 {
    var a = Boo(x: "s").b
    var b = Boo(x: "s").foo(1)
    if (a != 2) {
        return 1
    }
    if (b != "1s1") {
        print("${b}")
        return 2
    }
    var c = Boo().a
    if (c != "b") {
        return 3
    }
    return 0
}
