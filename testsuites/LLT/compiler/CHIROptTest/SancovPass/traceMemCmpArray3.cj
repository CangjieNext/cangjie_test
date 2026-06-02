// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: sancov.h sancov.cpp
// EXEC: %clang++ -c -fPIC %stdc++_opt sancov.cpp -o sancov.o
// EXEC: %compiler %dumpCHIRDebug --sanitizer-coverage-trace-memcmp sancov.o %n.cj -o %output 
// (Linux) EXEC: %cat %n\_CHIR/[0-9]*_Sanitizer_Coverage.chirtxt | sed -n -r '/Func @_CN7default6<main>Hv/,/^}$/p' | compare %f
// (Linux) ASSERT: regex Apply\(@__cj_sanitizer_weak_hook_memcmp.*-29-16
// (Linux) ASSERT: regex Apply\(@__cj_sanitizer_weak_hook_memcmp.*-33-16

class X {
    let a: Int64 = 1
    let b: Int32 = 2
}

extend X <: Comparable<X> {
    public func compare(x: X) {
        return Ordering.LT
    }
}

main(): Int64 {
    let arrViaString: Array<String> = ["cangjie", "cang", "jie"]
    let arrViaArrF: Array<Array<String>> = Array<Array<String>>(2, repeat: arrViaString)
    let arrViaArrS = arrViaArrF.clone()
    let res1 = arrViaArrS == arrViaArrF

    let arrClass: Array<X> = [X(), X()]
    let arrClass2 = arrClass.clone()
    let res2 = arrClass == arrClass2
    0
}
