/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %overflow_wrapping %f -o %output
// (not Windows) RUN-EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// (Windows) RUN-EXEC-PIPE: %run %run_opt %output %run_args 2>&1 1>log.txt && bash -c "dos2unix log.txt" && bash -c "cat log.txt" | compare %f
/* SCAN-IN
12345
1001
 */

open class MyExp <: Exception {
    public var xx: Int32 = 0
    public MyExp() {
        xx = 123
    }
}

class MyExp1 <: MyExp {
    public var yy: Int32 = 0
    public static var serialVersionUID: Int64 = 102
    public MyExp1() {
        yy = 1234
    }
}

class MyExp2 <: MyExp {
    public var yy: Int32 = 0
    public static var serialVersionUID: Int64 = 103
    public MyExp2() {
        yy = 12345
    }
}

class MyExp3 <: MyExp {
    public var yy: Int32 = 0
    public static var serialVersionUID: Int64 = 104
    public MyExp3() {
        yy = 123456
    }
}

class Eh2Clobber {
    public static func foo(c: Int32): Int32 {
        var res: Int32 = 0
        try {
            if (c == 0) {
                throw MyExp2()
            } else {
                res = 1
            }
        } finally {
            try {
                throw MyExp3()
            } catch (e: MyExp3) {
                res += 1000
            }
        }
        return res
    }

    public static func TestMain(c: Int32): Int32 {
        var res: Int32 = 0
        try {
            res = foo(c)
        } catch (e: MyExp2) {
            res += e.yy
        } catch (e: Exception) {
            res += 100
        }
        return res
    }
}

main(): Int64 {
    print(Eh2Clobber.TestMain(0).toString() + "\n")
    print(Eh2Clobber.TestMain(1).toString() + "\n")
    return 0
}
