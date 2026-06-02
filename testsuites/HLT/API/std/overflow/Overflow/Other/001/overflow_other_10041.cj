/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan-not success
// ASSERT: scan OverflowException

var temp: Int8 = 1

func f1() {
    return temp + 99
}

interface I {
    @OverflowSaturating
    func test(): Int8
}

class A {}

extend A <: I {
    public func test(): Int8 {
        var x: Int8 = f1()
        var y: Int8 = f1()
        return x + y
    }
}

main() {
    var res = Int64((A().test()) - 127)
    print("success")
    return res
}
