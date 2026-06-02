/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %overflow_wrapping %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args

var temp: Int32 = 1

func f1() {
    return temp - 1
}

class Exnested {
    public var x1: Int32 = 0
    public var x2: Int32 = 0
    public var x3: Int32 = 0

    public Exnested() {
        x1 = -1
        x2 = -1
        x3 = -1
    }

    public func get0(): Int32 {
        return f1()
    }

    public static func TestMain(c: Int32): Int32 {
        var exobj: Exnested = Exnested()
        var b: Int32 = 0
        try {
            exobj.x1 += 132
            try {
                var z0: Int32 = exobj.get0()
                if (c == 2) {
                    b = 39 / (z0 + 1)
                } else {
                    b = 39 / z0
                }
            } catch (e: ArithmeticException) {
                exobj.x1 += 7
            }
            try {
                exobj.x1 /= 3
                var z0: Int32 = exobj.get0()
                if (c == 0) {
                    b = 39 / z0
                } else {
                    b = 39 / (z0 + 1)
                }
            } catch (e: ArithmeticException) {
                exobj.x1 += 11
            }
        } catch (e: Exception) {
            exobj.x1 += 33
        }
        return exobj.x1
    }
}

main(): Int64 {
    if (Exnested.TestMain(-1) == 46 && Exnested.TestMain(-100) == 46 && Exnested.TestMain(1) == 46) {
        return 0
    }
    return 1
}
