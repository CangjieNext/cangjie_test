// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (DEBUG_OPTION)EXEC: %compiler %debugCHIROpt %n.cj -o %output 2>&1
// (DEBUG_OPTION)EXEC: %run %run_opt %output | compare %f

// Tests basic constant evaluation with `String` type.

const func a() {
    return "abc"
}

const func b() {
    return "ABC"
}

const s1 = a() + b()
const s2 = b() + a()

main() {
    println(s1)
    println(s2)
    return 0
}

/* SCAN
abcABC
ABCabc
*/