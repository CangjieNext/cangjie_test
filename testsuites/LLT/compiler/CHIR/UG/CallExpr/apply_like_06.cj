// (DEBUG_OPTION) EXEC: %compiler %f %dumpCHIRDebug -o %n.%suffix
// (DEBUG_OPTION) EXEC: %run %run_opt %n.%suffix
// (not Windows and DEBUG_OPTION) EXEC-PIPE-0: %cat %n\_CHIR/[0-9]*\_Canonicalization.chirtxt | compare %f
// (not Windows and DEBUG_OPTION) ASSERT: scan-4 Apply(ThisType: Class-_CN7default1AE&, @_CN7default1IIG_E4testHG_

interface I<T> {
    func test(a: T): Int64 {
        return 0
    }
}

open class C<T, V, M, N> <: I<T> & I<V> & I<M> & I<N> {
}

class A <: C<String, (Int64, Rune), Range<Int64>, () -> Int64> {}

main() {
    var a = A()
    return a.test("String") + a.test((1, r'a')) + a.test(0..10:1) + a.test({ => 1 })
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
