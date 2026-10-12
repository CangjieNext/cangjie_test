// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: ../pick_defination.py foo.c
// EXEC: %clang %clang_shared_opt foo.c -o libfoo.%dylib_suffix
// EXEC: %compiler %cmp_opt %enableO2 %dumpCHIRDebug -Woff all %n.cj -L . -l foo
// EXEC: %python pick_defination.py default_CHIR/[0-9]*_RedundantLoadElimination.chirtxt "Func @_CN7default6<main>Hv" | compare %f
// RUN-EXEC-PIPE-0: %pwd_to_ld_path %run main
// ASSERT: regex-begin %(?P<v>\d+): Int32 = Load\(%\d+\) // loc: "inout1.cj"-24-13
// ASSERT: regex-after NumericCast\(%(?P=v)\) // loc: "inout1.cj"-25
// ASSERT: regex-after NumericCast\(%(?P=v)\) // loc: "inout1.cj"-26
// ASSERT: regex = Load\(%\d+\) // loc: "inout1.cj"-28-13
// ASSERT: regex-not = Load\(%\d+\) // loc: "inout1.cj"-25
// ASSERT: regex-not = Load\(%\d+\) // loc: "inout1.cj"-26

foreign func PlusOne(ptr: CPointer<Int32>): Unit

main() {
    var a: Int32 = 0
    unsafe { PlusOne(inout a) }
    println(a)
    println(a)
    println(a)
    unsafe { PlusOne(inout a) }
    println(a)
}
