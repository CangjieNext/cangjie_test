// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan e1:EXHAUSTIVE_OTHER<Int64>.C(CCCC()) is EXHAUSTIVE_OTHER<Int64>=true
// ASSERT: scan e2:EXHAUSTIVE_OTHER<Int32>.C(CCCC()) is EXHAUSTIVE_OTHER<Int64>=false

open class AAAA {
    public var y: UInt64 = 888
}

class CCCC <: AAAA {
    public var x = 999
}

enum EXHAUSTIVE_OTHER<T> {
    A | B | C(CCCC) | D(T)

    @Frozen
    public func foo() {}
}

func isInstance<T>(x: T) {
    println(x is EXHAUSTIVE_OTHER<Int64>)
}

main() {
    var e1 = EXHAUSTIVE_OTHER<Int64>.C(CCCC())
    var e2 = EXHAUSTIVE_OTHER<Int32>.C(CCCC())
    e1.foo()
    print("e1:EXHAUSTIVE_OTHER<Int64>.C(CCCC()) is EXHAUSTIVE_OTHER<Int64>=")
    isInstance(e1)
    print("e2:EXHAUSTIVE_OTHER<Int32>.C(CCCC()) is EXHAUSTIVE_OTHER<Int64>=")
    isInstance(e2)
    return 0
}
