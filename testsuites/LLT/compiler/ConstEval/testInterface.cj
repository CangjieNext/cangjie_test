// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %cjc %debugCHIROpt %n.cj -o %output 2>&1 | compare %f
// (CJNATIVE) EXEC: %run %run_opt %output %run_args
// (DEBUG_OPTION) ASSERT: scan debug: consteval at :0:0 - :0:0 replaced initializer function `gv$_c1` with initializer constant(s).
// (DEBUG_OPTION) ASSERT: scan debug: consteval at :0:0 - :0:0 replaced initializer function `gv$_c2` with initializer constant(s).
// (DEBUG_OPTION) ASSERT: scan debug: consteval at :0:0 - :0:0 replaced initializer function `gv$_c3` with initializer constant(s).
// (DEBUG_OPTION) ASSERT: scan debug: consteval at :0:0 - :0:0 replaced initializer function `gv$_c4` with initializer constant(s).
// (DEBUG_OPTION) ASSERT: scan debug: consteval at :0:0 - :0:0 replaced initializer function `gv$_s1` with initializer constant(s).
// (DEBUG_OPTION) ASSERT: scan debug: consteval at :0:0 - :0:0 replaced initializer function `gv$_s2` with initializer constant(s).
// (DEBUG_OPTION) ASSERT: scan debug: consteval at :0:0 - :0:0 replaced initializer function `gv$_s3` with initializer constant(s).
// (DEBUG_OPTION) ASSERT: scan debug: consteval at :0:0 - :0:0 replaced initializer function `gv$_s4` with initializer constant(s).
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace


interface I {
    const func f(): Int64
    const static func f2(): Int64
}

class C <: I {
    const init() {}

    public const func f(): Int64 { 1 }
    public const static func f2(): Int64 { 2 }
}

struct S <: I {
    const init() {}

    public const func f(): Int64 { 3 }
    public const static func f2(): Int64 { 4 }
}

const func g<T>(i: T) where T <: I {
    return i.f() + T.f2()
}

const func g2(i: I) {
    return i.f()
}

const func h<T>(i: T) where T <: I {
    try {
        return i.f() + T.f2()
    } catch (e : Exception) {
        throw e
    }
}

const func h2(i: I) {
    try {
        return i.f()
    } catch (e : Exception) {
        throw e
    }
}

const c1 = g(C())
const c2 = h(C())
const c3 = g2(C())
const c4 = h2(C())

const s1 = g(S())
const s2 = h(S())
const s3 = g2(S())
const s4 = h2(S())

main() {}
