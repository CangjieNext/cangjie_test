/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f

// ASSERT: scan in interface\n
// ASSERT: scan-not Exception

interface Test {
    func test() {
        print("in interface\n")
    }
}

class Child <: Test {
    public let n: Int64

    public init(n: Int64) {
        this.n = n
    }
}

main(): Int64 {
    var result: Test = Child(1)

    let fut: Future<Test> = spawn {
        var result: Test = Child(2)
        return result
    }

    result = fut.get()

    match (fut.tryGet()) {
        case None => return 1
        case _ => ()
    }
    result.test()
    return 0
}
