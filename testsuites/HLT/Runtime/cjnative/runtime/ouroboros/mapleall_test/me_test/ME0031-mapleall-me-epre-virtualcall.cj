/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %overflow_wrapping %f -o %output
// (not Windows) RUN-EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// (Windows) RUN-EXEC-PIPE: %run %run_opt %output %run_args 2>&1 1>log.txt && bash -c "dos2unix log.txt" && bash -c "cat log.txt" | compare %f
/* SCAN-IN
Print Child
Print Child
Print Child
 */

open class Base {
    public open func Print(): Unit {
        print("Print Base\n")
    }

    public open func Dump(): Unit {
        print("Dump Base\n")
    }
}

class Child <: Base {
    public override func Print(): Unit {
        print("Print Child\n")
    }

    public override func Dump(): Unit {
        print("Dump Child\n")
    }
}

class Test {
    public static func Print(base: Base): Unit {
        var i: Int32 = 0
        while (i < 3) {
            base.Print()
            i++
        }
    }
}

main(): Int64 {
    var child: Child = Child()
    Test.Print(child)
    return 0
}
