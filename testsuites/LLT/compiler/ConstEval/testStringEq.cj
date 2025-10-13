// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (DEBUG_OPTION)EXEC: %compiler %debugCHIROpt %n.cj -o %output 2>&1 | compare %f
// (not CJNATIVE) ASSERT: scan debug: consteval at testStringEq.cj:33:1 - testStringEq.cj:33:15 evaluated from 10 nodes to 1 nodes
// (not CJNATIVE) ASSERT: scan debug: consteval at testStringEq.cj:34:1 - testStringEq.cj:34:15 evaluated from 10 nodes to 1 nodes
// (not CJNATIVE) ASSERT: scan debug: consteval at testStringEq.cj:35:1 - testStringEq.cj:35:20 evaluated from 6 nodes to 1 nodes
// (not CJNATIVE) ASSERT: scan debug: consteval at testStringEq.cj:36:1 - testStringEq.cj:36:20 evaluated from 6 nodes to 1 nodes
// (not CJNATIVE) ASSERT: scan debug: consteval at testStringEq.cj:37:1 - testStringEq.cj:37:20 evaluated from 5 nodes to 1 nodes
// (not CJNATIVE) ASSERT: scan debug: consteval at testStringEq.cj:38:1 - testStringEq.cj:38:20 evaluated from 5 nodes to 1 nodes
// (CJNATIVE) ASSERT: scan debug: consteval at testStringEq.cj:33:1 - testStringEq.cj:33:15 evaluated initializer function `gv$_s1` of 3 expressions to one of 2 expressions.
// (CJNATIVE) ASSERT: scan debug: consteval at testStringEq.cj:34:1 - testStringEq.cj:34:15 evaluated initializer function `gv$_s2` of 3 expressions to one of 2 expressions.
// (CJNATIVE) ASSERT: scan debug: consteval at testStringEq.cj:35:1 - testStringEq.cj:35:20 replaced initializer function `gv$_r1` with initializer constant(s).
// (CJNATIVE) ASSERT: scan debug: consteval at testStringEq.cj:36:1 - testStringEq.cj:36:20 replaced initializer function `gv$_r2` with initializer constant(s).
// (CJNATIVE) ASSERT: scan debug: consteval at testStringEq.cj:37:1 - testStringEq.cj:37:20 replaced initializer function `gv$_r3` with initializer constant(s).
// (CJNATIVE) ASSERT: scan debug: consteval at testStringEq.cj:38:1 - testStringEq.cj:38:20 replaced initializer function `gv$_r4` with initializer constant(s).
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
    return 0
}