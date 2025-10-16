// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (DEBUG_OPTION) EXEC: %cjc %compile_exe_opt %debugCHIROpt %n.cj -o %output 2>&1 | compare %f
// (DEBUG_OPTION) EXEC: %run %output
// ASSERT: scan debug: consteval at :0:0 - :0:0 replaced initializer function `gv$_a1` with initializer constant(s).
// ASSERT: scan debug: consteval at :0:0 - :0:0 replaced initializer function `gv$_a2` with initializer constant(s).
// ASSERT: scan debug: consteval at :0:0 - :0:0 replaced initializer function `gv$_a3` with initializer constant(s).
// ASSERT: scan debug: consteval at :0:0 - :0:0 replaced initializer function `gv$_a4` with initializer constant(s).
// ASSERT: scan debug: consteval at :0:0 - :0:0 replaced initializer function `gv$_a5` with initializer constant(s).
// ASSERT: scan debug: consteval at :0:0 - :0:0 replaced initializer function `gv$_a6` with initializer constant(s).
// ASSERT: scan debug: consteval at :0:0 - :0:0 replaced initializer function `gv$_a7` with initializer constant(s).
// ASSERT: scan debug: consteval at :0:0 - :0:0 replaced initializer function `gv$_a8` with initializer constant(s).
// ASSERT: scan debug: consteval at :0:0 - :0:0 replaced initializer function `gv$_a9` with initializer constant(s).
// ASSERT: scan debug: consteval at :0:0 - :0:0 replaced initializer function `gv$_a10` with initializer constant(s).
// ASSERT: scan debug: consteval at :0:0 - :0:0 replaced initializer function `gv$_a11` with initializer constant(s).
// ASSERT: scan debug: consteval at :0:0 - :0:0 replaced initializer function `gv$_a12` with initializer constant(s).
// ASSERT: scan debug: consteval at :0:0 - :0:0 replaced initializer function `gv$_a13` with initializer constant(s).
// ASSERT: scan debug: consteval at :0:0 - :0:0 replaced initializer function `gv$_a14` with initializer constant(s).
// ASSERT: scan debug: consteval at :0:0 - :0:0 replaced initializer function `gv$_a15` with initializer constant(s).
// ASSERT: scan debug: consteval at :0:0 - :0:0 replaced initializer function `gv$_a16` with initializer constant(s).
// ASSERT: scan debug: consteval at :0:0 - :0:0 replaced initializer function `gv$_a17` with initializer constant(s).
// ASSERT: scan debug: consteval at :0:0 - :0:0 replaced initializer function `gv$_a18` with initializer constant(s).
// ASSERT: scan debug: consteval at :0:0 - :0:0 replaced initializer function `gv$_a19` with initializer constant(s).
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

const func isSome<T>(x: Option<T>): Bool {
    match (x) {
        case Some(_) => true
        case None => false
    }
}

const func anyAs(x: Any): Bool {
    let i8 = x as Int8
    let i16 = x as Int16
    let i32 = x as Int32
    let i64 = x as Int64
    let iN = x as IntNative
    let u8 = x as UInt8
    let u16 = x as UInt16
    let u32 = x as UInt32
    let u64 = x as UInt64
    let uN = x as UIntNative
    let f16 = x as Float16
    let f32 = x as Float32
    let f64 = x as Float64
    let unit = x as Unit
    let bool = x as Bool
    let rune = x as Rune
    let s = x as S
    let c = x as C
    let e = x as E
    isSome(i8) || isSome(i16) || isSome(i32) || isSome(i64) || isSome(iN) ||
        isSome(u8) || isSome(u16) || isSome(u32) || isSome(u64) || isSome(uN) ||
        isSome(f16) || isSome(f32) || isSome(f64) || isSome(unit) || isSome(bool) ||
        isSome(rune) || isSome(s) || isSome(c) || isSome(e)
}

const oneNative : IntNative = 1
const oneUNative : UIntNative = 1

const a1 = anyAs(1i8)
const a2 = anyAs(1i16)
const a3 = anyAs(1i32)
const a4 = anyAs(1i64)
const a5 = anyAs(oneNative)
const a6 = anyAs(1u8)
const a7 = anyAs(1u16)
const a8 = anyAs(1u32)
const a9 = anyAs(1u64)
const a10 = anyAs(oneUNative)
const a11 = anyAs(1.0f16)
const a12 = anyAs(1.0f32)
const a13 = anyAs(1.0f64)
const a14 = anyAs(())
const a15 = anyAs(false)
const a16 = anyAs(r'A')
const a17 = anyAs(S())
const a18 = anyAs(C())
const a19 = anyAs(E.A)

main() {
    if (a1 && a2 && a3 && a4 && a5 && a6 && a7 && a8 && a9 && a10 && a11 && a12 && a13 && a14 && a15 && a16 && a17 && a18 && a19) {
        return 0
    }
    return 1
}