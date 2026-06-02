/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: pkgs
// EXEC: %compiler %cmp_opt %compile_lib_opt pkgs/pkgs.cj -o pkgs.%middle
// EXEC: %compiler %cmp_opt %f pkgs.%middle -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import pkgs.Data

var top: Data<Int32> = Data<Int32>(1, 0)

class Time {
    public var a: Data<Int32>
    public Time(x: Data<Int32>) {
        a = x
    }
    public func geta(): Data<Int32> {
        return a
    }
}

struct Day {
    public let b: Data<Int32>
    public Day(x: Data<Int32>) {
        b = x
    }
    public func getb(): Data<Int32> {
        return b
    }
}

main(): Int64 {
    return run()
}

func run(): Int64 {
    let d: Data<Int32> = Data<Int32>(3, 0)
    let time: Time = Time(d)
    let c: Data<Int32> = Time(d).geta()
    let day: Day = Day(d)
    if (top.area() == 1 && d.area() == 3 && time.geta().area() == 3 && c.area() == 3 && day.getb().area() == 3) {
        return 0
    }
    return 1
}
