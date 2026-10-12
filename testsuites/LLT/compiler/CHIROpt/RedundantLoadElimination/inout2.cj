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
// ASSERT: regex-begin %(?P<v>\d+): Int32 = Load\(%\d+\) // loc: "inout2.cj"-26-13
// ASSERT: regex-after NumericCast\(%(?P=v)\) // loc: "inout2.cj"-27
// ASSERT: regex-after NumericCast\(%(?P=v)\) // loc: "inout2.cj"-28
// ASSERT: regex = Load\(%\d+\) // loc: "inout2.cj"-32-13
// ASSERT: regex-not = Load\(%\d+\) // loc: "inout2.cj"-27
// ASSERT: regex-not = Load\(%\d+\) // loc: "inout2.cj"-28

foreign func PlusOne(ptr: CPointer<Int32>): Unit

main() {
    var a: Int32 = 0
    try {
        unsafe { PlusOne(inout a) }
    } finally {}
    println(a)
    println(a)
    println(a)
    try {
        unsafe { PlusOne(inout a) }
    } finally {}
    println(a)
}
