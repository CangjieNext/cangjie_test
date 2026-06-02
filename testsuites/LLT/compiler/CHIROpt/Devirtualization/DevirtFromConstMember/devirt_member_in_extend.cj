// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE-0: %compiler %debugCHIROpt %enableDevirtualization -Woff all %f -o %n.%suffix 2>&1 | compare %f
// EXEC-PIPE-0: %run %run_opt %output %run_args
// (not Windows) ASSERT: scan [Devirtualization] The function call to getMySize at [35,12] was optimized.

import std.collection.ArrayList
interface mySize {
    func getMySize(): Int64
}

extend<T> Array<T> <: mySize {
    public func getMySize(): Int64 {
        return 10
    }
}

extend<T> ArrayList<T> <: mySize {
    public func getMySize(): Int64 {
        return 8
    }
}

public class A<T> {
    let a: mySize = Array<T>()
}

main() {
    let a = A<Int64>()
    let b = a.a
    return b.getMySize() - 10
}