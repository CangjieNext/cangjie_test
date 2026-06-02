// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0

// EXEC: %compiler %cmp_opt %enableCompileDebug %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

class Future2 {
    public init() {
        this.done = false
    }

    private var done: Bool

    public func getResult2(): Unit {
        print(done.toString())
        let f = {
            =>
            done = true
            return true
        }
        f()
        print(done.toString())
        return
    }
}

main(): Int64 {
    let f = Future2()
    f.getResult2()
    return 0
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
