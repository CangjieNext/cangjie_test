// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

struct Date {
    public let width: Int32 = 1
    public let length: Int32 = 2
    public let perimeter: () -> Int32 = {
        =>
        var res: Int32 = 100;
        return res
    }
}

struct Time {
    public let width: Int32 = 1
    public let length: Int32 = 2
    public let perimeter: (Unit) -> Int64 = {a: Unit => 4}
}

main(): Int64 {
    let width: Int32 = 1
    let length: Int32 = 2
    let perimeter: (Unit) -> Int32 = {
        a: Unit =>
        var res: Int32 = 10;
        return res
    }
    var date: Date = Date()
    var time: Time = Time()
    if (perimeter(()) + date.perimeter() + Int32(time.perimeter(())) == 114) {
        return 0
    }
    return 1
}
