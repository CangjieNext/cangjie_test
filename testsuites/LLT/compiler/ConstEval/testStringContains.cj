// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-1: %compiler %n.cj -o %output 2>&1 | compare %f
// ASSERT: scan error: expected 'const' expression guaranteed to be evaluated at compile time
// ASSERT: scan const r5 = s1.contains("a")
// ASSERT: scan const r6 = s1.contains("ab")
// ASSERT: scan const r7 = s1.contains("abc")
// ASSERT: scan const r8 = s1.contains("ac")
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

// Tests basic constant evaluation with `String` type.

const func a(){
    return "abc"
}

const func b(){
    return "ABC"
}

const s1 = a()
const s2 = b()
const r1 = s1 == s2
const r2 = s1 != s2
const r3 = s1 == s1
const r4 = s1 != s1
const r5 = s1.contains("a")
const r6 = s1.contains("ab")
const r7 = s1.contains("abc")
const r8 = s1.contains("ac")
main() {
    if (r1) {
        return 1
    }
    if (!r2) {
        return 2
    }
    if (!r3) {
        return 3
    }
    if (!r4) {
        return 4
    }
    if (!r5) {
        return 5
    }
    if (!r6) {
        return 6
    }
    if (!r7) {
        return 7
    }
    if (r8) {
        return 8
    }
    return 0
}