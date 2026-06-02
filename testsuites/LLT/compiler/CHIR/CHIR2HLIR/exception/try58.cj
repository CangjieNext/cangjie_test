// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %enableCompileDebug %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix 2>&1 | compare %f

// ASSERT: scan in spawn 1
// ASSERT: scan try lambda!
// ASSERT: scan finally lambda!
// ASSERT: scan execute done
// ASSERT: scan finally

public func ResumeAllForFuture2<T>(callback: () -> Bool): Unit {
    callback()
}

class Future2<T> {
    public init(fn: () -> T) {
        this.executeFn = fn
    }

    private var executeFn: () -> T

    // Execute task and set result, only can be used in CodeGen.
    public func execute(): Unit {
        try {
            this.executeFn()
            let f: () -> Bool = {
                =>
                try {
                    print("try lambda!\n")
                    return true
                } finally {
                    print("finally lambda!\n")
                }
                return false
            }
            ResumeAllForFuture2<T>(f)
            print("execute done\n")
        } catch (e: Exception) {
            e.printStackTrace();
        } finally {
            print("finally\n")
        }
        return
    }
}

main(): Int64 {
    let f = Future2({
        => print("in spawn 1\n")
    })
    f.execute()
    return 0
}
