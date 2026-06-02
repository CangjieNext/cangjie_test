// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// (DEBUG_OPTION)EXEC-PIPE-0: %compiler %debugCHIROpt %n.cj -o %output 2>&1 | compare %f
// (DEBUG_OPTION)EXEC: %run %output
// ASSERT: regex The function call to fi1 in .* was an invoke call
// ASSERT: regex The function call to fi1 in .* was an invoke call
// ASSERT: regex The function call to fc1 in .* was an apply call
// ASSERT: regex The function call to fc1 in .* was an apply call
// ASSERT: regex The function call to fc2 in .* was an apply call
// ASSERT: regex The function call to fc3 in .* was an apply call
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

interface I1 {
    func fi1(): Int64 {
        return 1
    }
}

interface I2<T> {}

open class C1 <: I1 {
    func fc1(): Int64 {
        var y: Int64 = fi1()
        return y
    }
}

class C2 <: C1 & I1 & I2<Int64> {
    init() {
        super()
    }

    func fc2(): Int64 {
        var a: Int64 = fi1()
        var b: Int64 = super.fc1()
        return a + b
    }
}

class C3 <: I2<Int32> & I2<Int64> {
    func fc3(): Int64 {
        return 2
    }
}

main() {
    var data1 = C1().fc1()
    var data2 = C2().fc2()
    var data3 = C3().fc3()
    return 0
}
