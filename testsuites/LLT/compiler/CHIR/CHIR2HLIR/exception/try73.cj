// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %enableCompileDebug %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix 2>&1 | compare %f

// ASSERT: scan Execute
// ASSERT: scan lambda
// ASSERT: scan Catch
// ASSERT: scan Finally
// ASSERT: scan success.

class A <: Exception {}

public class Future2 {
    public init(fn: () -> Int64) {
        this.executeFn = fn
    }
    private var executeFn: () -> Int64
    public func execute(): Unit {
        print("Execute\n")
        try {
            this.executeFn()
            return
        } catch (e: Exception) {
            print("Catch\n")
        } finally {
            print("Finally\n")
        }
        return
    }
}

main() {
    let f = Future2(
        {
            =>
            print("lambda\n")
            throw A()
            return 0
        }
    )
    f.execute()
    print("success.")
    return 0
}
