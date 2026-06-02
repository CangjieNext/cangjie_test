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
Child::Print1
Child::Print2
Child::Print3
 */

open class Base {
    public open func Print1(): Unit {
        print("Base::Print1\n")
    }

    public open func Print2(): Unit {
        print("Base::Print2\n")
    }

    public open func Print3(): Unit {
        print("Base::Print3\n")
    }
}

class Child <: Base {
    public override func Print1(): Unit {
        print("Child::Print1\n")
    }

    public override func Print2(): Unit {
        print("Child::Print2\n")
    }

    public override func Print3(): Unit {
        print("Child::Print3\n")
    }
}

class Test {
    public static func Print(obj: Base): Unit {
        obj.Print1()
        obj.Print2()
        obj.Print3()
    }
}

main(): Int64 {
    var child: Child = Child()
    Test.Print(child)
    return 0
}
