// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// (DEBUG_OPTION)EXEC-PIPE-0: %compiler %debugCHIROpt %n.cj -o %output 2>&1 | compare %f
// (DEBUG_OPTION)EXEC: %run %output
// ASSERT: regex The function call to b .* was an invoke call
// ASSERT: regex The function call to a .* was an invoke call
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

package abc

public interface interfaceA {
    func a(a: Int64) {
        b(a) //invoke
    }
    func b(b: Int64): Int64
}

public interface interfaceB {}

public abstract class C <: interfaceA & interfaceB {}

public open class B <: C {
    @OverflowWrapping
    public func b(b: Int64) {
        123
    }
}

main(): Int64 {
    var b: B = B()
    if (b.a(1) == 123) { // apply
        return 0
    } else {
        return 1
    }
}
