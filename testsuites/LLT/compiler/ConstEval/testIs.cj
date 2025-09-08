// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (DEBUG_OPTION) EXEC: %cjc %compile_exe_opt %debugCHIROpt %n.cj -o %output 2>&1 | compare %f
// (DEBUG_OPTION) EXEC: %run %output
// ASSERT: scan debug: consteval at testIs.cj:69:1 - testIs.cj:69:22 replaced initializer function `gv$_a1` with initializer constant(s).
// ASSERT: scan debug: consteval at testIs.cj:70:1 - testIs.cj:70:23 replaced initializer function `gv$_a2` with initializer constant(s).
// ASSERT: scan debug: consteval at testIs.cj:71:1 - testIs.cj:71:23 replaced initializer function `gv$_a3` with initializer constant(s).
// ASSERT: scan debug: consteval at testIs.cj:72:1 - testIs.cj:72:23 replaced initializer function `gv$_a4` with initializer constant(s).
// ASSERT: scan debug: consteval at testIs.cj:73:1 - testIs.cj:73:28 replaced initializer function `gv$_a5` with initializer constant(s).
// ASSERT: scan debug: consteval at testIs.cj:74:1 - testIs.cj:74:22 replaced initializer function `gv$_a6` with initializer constant(s).
// ASSERT: scan debug: consteval at testIs.cj:75:1 - testIs.cj:75:23 replaced initializer function `gv$_a7` with initializer constant(s).
// ASSERT: scan debug: consteval at testIs.cj:76:1 - testIs.cj:76:23 replaced initializer function `gv$_a8` with initializer constant(s).
// ASSERT: scan debug: consteval at testIs.cj:77:1 - testIs.cj:77:23 replaced initializer function `gv$_a9` with initializer constant(s).
// ASSERT: scan debug: consteval at testIs.cj:78:1 - testIs.cj:78:30 replaced initializer function `gv$_a10` with initializer constant(s).
// ASSERT: scan debug: consteval at testIs.cj:79:1 - testIs.cj:79:26 replaced initializer function `gv$_a11` with initializer constant(s).
// ASSERT: scan debug: consteval at testIs.cj:80:1 - testIs.cj:80:26 replaced initializer function `gv$_a12` with initializer constant(s).
// ASSERT: scan debug: consteval at testIs.cj:81:1 - testIs.cj:81:26 replaced initializer function `gv$_a13` with initializer constant(s).
// ASSERT: scan debug: consteval at testIs.cj:82:1 - testIs.cj:82:22 replaced initializer function `gv$_a14` with initializer constant(s).
// ASSERT: scan debug: consteval at testIs.cj:83:1 - testIs.cj:83:25 replaced initializer function `gv$_a15` with initializer constant(s).
// ASSERT: scan debug: consteval at testIs.cj:84:1 - testIs.cj:84:24 replaced initializer function `gv$_a16` with initializer constant(s).
// ASSERT: scan debug: consteval at testIs.cj:85:1 - testIs.cj:85:23 replaced initializer function `gv$_a17` with initializer constant(s).
// ASSERT: scan debug: consteval at testIs.cj:86:1 - testIs.cj:86:23 replaced initializer function `gv$_a18` with initializer constant(s).
// ASSERT: scan debug: consteval at testIs.cj:87:1 - testIs.cj:87:23 replaced initializer function `gv$_a19` with initializer constant(s).
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

struct S {
    const init() {}
}

class C {
    const init() {}
}

enum E {
    A
}

const func anyIs(x: Any): Bool {
    let i8 = x is Int8
    let i16 = x is Int16
    let i32 = x is Int32
    let i64 = x is Int64
    let iN = x is IntNative
    let u8 = x is UInt8
    let u16 = x is UInt16
    let u32 = x is UInt32
    let u64 = x is UInt64
    let uN = x is UIntNative
    let f16 = x is Float16
    let f32 = x is Float32
    let f64 = x is Float64
    let unit = x is Unit
    let bool = x is Bool
    let rune = x is Rune
    let s = x is S
    let c = x is C
    let e = x is E
    i8 || i16 || i32 || i64 || iN || u8 || u16 || u32 || u64 || uN || f16 || f32 || f64 || unit || bool || rune || s || c || e
}

const oneNative: IntNative = 1
const oneUNative: UIntNative = 1

const a1 = anyIs(1i8)
const a2 = anyIs(1i16)
const a3 = anyIs(1i32)
const a4 = anyIs(1i64)
const a5 = anyIs(oneNative)
const a6 = anyIs(1u8)
const a7 = anyIs(1u16)
const a8 = anyIs(1u32)
const a9 = anyIs(1u64)
const a10 = anyIs(oneUNative)
const a11 = anyIs(1.0f16)
const a12 = anyIs(1.0f32)
const a13 = anyIs(1.0f64)
const a14 = anyIs(())
const a15 = anyIs(false)
const a16 = anyIs(r'A')
const a17 = anyIs(S())
const a18 = anyIs(C())
const a19 = anyIs(E.A)

main() {
    if (a1 && a2 && a3 && a4 && a5 && a6 && a7 && a8 && a9 && a10 && a11 && a12 && a13 && a14 && a15 && a16 && a17 && a18 && a19) {
        return 0
    }
    return 1
}