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
Exception
Finally
PASS
 */

class Container {
    public var SS: Array<String> = []

    public Container() {}

    public func Set(ss: Array<String>): Unit {
        SS = ss
    }

    public func Get(): Array<String> {
        return SS
    }
}

class Test {
    private static var SS: Array<String> = ["PASS", "Fail"]
    private static var CC: Container = Container()

    public func GetOutputString(): String {
        var strS: Array<String> = SS
        try {
            if (SS.size > 1) {
                strS = CC.SS
            }
            return SS[2]
        } catch (e: Exception) {
            print("Exception\n")
        } finally {
            print("Finally\n")
        }
        return SS[0]
    }
}

main(): Int64 {
    var t: Test = Test()
    print(t.GetOutputString() + "\n")
    return 0
}
