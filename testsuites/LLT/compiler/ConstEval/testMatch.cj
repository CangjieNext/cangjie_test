// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (DEBUG_OPTION) EXEC: %cjc %compile_exe_opt %debugCHIROpt %n.cj -o %output 2>&1 | compare %f
// (DEBUG_OPTION) EXEC: %run %output
// ASSERT: scan debug: consteval at testMatch.cj:63:1 - testMatch.cj:63:26 replaced initializer function `gv$_m1i8` with initializer constant(s).
// ASSERT: scan debug: consteval at testMatch.cj:64:1 - testMatch.cj:64:26 replaced initializer function `gv$_m2i8` with initializer constant(s).
// ASSERT: scan debug: consteval at testMatch.cj:65:1 - testMatch.cj:65:27 replaced initializer function `gv$_m3i8` with initializer constant(s).
// ASSERT: scan debug: consteval at testMatch.cj:75:1 - testMatch.cj:75:28 replaced initializer function `gv$_m1i16` with initializer constant(s).
// ASSERT: scan debug: consteval at testMatch.cj:76:1 - testMatch.cj:76:28 replaced initializer function `gv$_m2i16` with initializer constant(s).
// ASSERT: scan debug: consteval at testMatch.cj:77:1 - testMatch.cj:77:29 replaced initializer function `gv$_m3i16` with initializer constant(s).
// ASSERT: scan debug: consteval at testMatch.cj:87:1 - testMatch.cj:87:28 replaced initializer function `gv$_m1i32` with initializer constant(s).
// ASSERT: scan debug: consteval at testMatch.cj:88:1 - testMatch.cj:88:28 replaced initializer function `gv$_m2i32` with initializer constant(s).
// ASSERT: scan debug: consteval at testMatch.cj:89:1 - testMatch.cj:89:29 replaced initializer function `gv$_m3i32` with initializer constant(s).
// ASSERT: scan debug: consteval at testMatch.cj:99:1 - testMatch.cj:99:28 replaced initializer function `gv$_m1i64` with initializer constant(s).
// ASSERT: scan debug: consteval at testMatch.cj:100:1 - testMatch.cj:100:28 replaced initializer function `gv$_m2i64` with initializer constant(s).
// ASSERT: scan debug: consteval at testMatch.cj:101:1 - testMatch.cj:101:29 replaced initializer function `gv$_m3i64` with initializer constant(s).
// ASSERT: scan debug: consteval at testMatch.cj:111:1 - testMatch.cj:111:36 replaced initializer function `gv$_m1iNative` with initializer constant(s).
// ASSERT: scan debug: consteval at testMatch.cj:112:1 - testMatch.cj:112:36 replaced initializer function `gv$_m2iNative` with initializer constant(s).
// ASSERT: scan debug: consteval at testMatch.cj:113:1 - testMatch.cj:113:37 replaced initializer function `gv$_m3iNative` with initializer constant(s).
// ASSERT: scan debug: consteval at testMatch.cj:123:1 - testMatch.cj:123:27 replaced initializer function `gv$_m1u8` with initializer constant(s).
// ASSERT: scan debug: consteval at testMatch.cj:124:1 - testMatch.cj:124:27 replaced initializer function `gv$_m2u8` with initializer constant(s).
// ASSERT: scan debug: consteval at testMatch.cj:125:1 - testMatch.cj:125:28 replaced initializer function `gv$_m3u8` with initializer constant(s).
// ASSERT: scan debug: consteval at testMatch.cj:135:1 - testMatch.cj:135:29 replaced initializer function `gv$_m1u16` with initializer constant(s).
// ASSERT: scan debug: consteval at testMatch.cj:136:1 - testMatch.cj:136:29 replaced initializer function `gv$_m2u16` with initializer constant(s).
// ASSERT: scan debug: consteval at testMatch.cj:137:1 - testMatch.cj:137:30 replaced initializer function `gv$_m3u16` with initializer constant(s).
// ASSERT: scan debug: consteval at testMatch.cj:147:1 - testMatch.cj:147:29 replaced initializer function `gv$_m1u32` with initializer constant(s).
// ASSERT: scan debug: consteval at testMatch.cj:148:1 - testMatch.cj:148:29 replaced initializer function `gv$_m2u32` with initializer constant(s).
// ASSERT: scan debug: consteval at testMatch.cj:149:1 - testMatch.cj:149:30 replaced initializer function `gv$_m3u32` with initializer constant(s).
// ASSERT: scan debug: consteval at testMatch.cj:159:1 - testMatch.cj:159:29 replaced initializer function `gv$_m1u64` with initializer constant(s).
// ASSERT: scan debug: consteval at testMatch.cj:160:1 - testMatch.cj:160:29 replaced initializer function `gv$_m2u64` with initializer constant(s).
// ASSERT: scan debug: consteval at testMatch.cj:161:1 - testMatch.cj:161:30 replaced initializer function `gv$_m3u64` with initializer constant(s).
// ASSERT: scan debug: consteval at testMatch.cj:171:1 - testMatch.cj:171:37 replaced initializer function `gv$_m1uNative` with initializer constant(s).
// ASSERT: scan debug: consteval at testMatch.cj:172:1 - testMatch.cj:172:37 replaced initializer function `gv$_m2uNative` with initializer constant(s).
// ASSERT: scan debug: consteval at testMatch.cj:173:1 - testMatch.cj:173:38 replaced initializer function `gv$_m3uNative` with initializer constant(s).
// ASSERT: scan debug: consteval at testMatch.cj:183:1 - testMatch.cj:183:31 replaced initializer function `gv$_m1Rune` with initializer constant(s).
// ASSERT: scan debug: consteval at testMatch.cj:184:1 - testMatch.cj:184:32 replaced initializer function `gv$_m2Rune` with initializer constant(s).
// ASSERT: scan debug: consteval at testMatch.cj:185:1 - testMatch.cj:185:32 replaced initializer function `gv$_m3Rune` with initializer constant(s).
// ASSERT: scan debug: consteval at testMatch.cj:194:1 - testMatch.cj:194:31 replaced initializer function `gv$_m1Bool` with initializer constant(s).
// ASSERT: scan debug: consteval at testMatch.cj:195:1 - testMatch.cj:195:32 replaced initializer function `gv$_m2Bool` with initializer constant(s).
// ASSERT: scan debug: consteval at testMatch.cj:204:1 - testMatch.cj:204:38 replaced initializer function `gv$_m1Option` with initializer constant(s).
// ASSERT: scan debug: consteval at testMatch.cj:205:1 - testMatch.cj:205:35 replaced initializer function `gv$_m2Option` with initializer constant(s).
// ASSERT: scan debug: consteval at testMatch.cj:229:1 - testMatch.cj:229:28 evaluated initializer function `gv$_m1Enum`
// ASSERT: scan debug: consteval at testMatch.cj:230:1 - testMatch.cj:230:28 evaluated initializer function `gv$_m2Enum`
// ASSERT: scan debug: consteval at testMatch.cj:231:1 - testMatch.cj:231:28 evaluated initializer function `gv$_m3Enum`
// ASSERT: scan debug: consteval at testMatch.cj:233:1 - testMatch.cj:233:30 evaluated initializer function `gv$_m1Enum2`
// ASSERT: scan debug: consteval at testMatch.cj:234:1 - testMatch.cj:234:30 evaluated initializer function `gv$_m2Enum2`
// ASSERT: scan debug: consteval at testMatch.cj:235:1 - testMatch.cj:235:30 evaluated initializer function `gv$_m3Enum2`
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

const func matchInt8(x: Int8): Int8 {
    match (x) {
        case 1 => 1
        case 4 => 2
        case _ => 3
    }
}

const m1i8 = matchInt8(1)
const m2i8 = matchInt8(4)
const m3i8 = matchInt8(14)

const func matchInt16(x: Int16): Int16 {
    match (x) {
        case 1 => 1
        case 4 => 2
        case _ => 3
    }
}

const m1i16 = matchInt16(1)
const m2i16 = matchInt16(4)
const m3i16 = matchInt16(14)

const func matchInt32(x: Int32): Int32 {
    match (x) {
        case 1 => 1
        case 4 => 2
        case _ => 3
    }
}

const m1i32 = matchInt32(1)
const m2i32 = matchInt32(4)
const m3i32 = matchInt32(14)

const func matchInt64(x: Int64): Int64 {
    match (x) {
        case 1 => 1
        case 4 => 2
        case _ => 3
    }
}

const m1i64 = matchInt64(1)
const m2i64 = matchInt64(4)
const m3i64 = matchInt64(14)

const func matchIntNative(x: IntNative): IntNative {
    match (x) {
        case 1 => 1
        case 4 => 2
        case _ => 3
    }
}

const m1iNative = matchIntNative(1)
const m2iNative = matchIntNative(4)
const m3iNative = matchIntNative(14)

const func matchUInt8(x: UInt8): UInt8 {
    match (x) {
        case 1 => 1
        case 4 => 2
        case _ => 3
    }
}

const m1u8 = matchUInt8(1)
const m2u8 = matchUInt8(4)
const m3u8 = matchUInt8(14)

const func matchUInt16(x: UInt16): UInt16 {
    match (x) {
        case 1 => 1
        case 4 => 2
        case _ => 3
    }
}

const m1u16 = matchUInt16(1)
const m2u16 = matchUInt16(4)
const m3u16 = matchUInt16(14)

const func matchUInt32(x: UInt32): UInt32 {
    match (x) {
        case 1 => 1
        case 4 => 2
        case _ => 3
    }
}

const m1u32 = matchUInt32(1)
const m2u32 = matchUInt32(4)
const m3u32 = matchUInt32(14)

const func matchUInt64(x: UInt64): UInt64 {
    match (x) {
        case 1 => 1
        case 4 => 2
        case _ => 3
    }
}

const m1u64 = matchUInt64(1)
const m2u64 = matchUInt64(4)
const m3u64 = matchUInt64(14)

const func matchUIntNative(x: UIntNative): UIntNative {
    match (x) {
        case 1 => 1
        case 4 => 2
        case _ => 3
    }
}

const m1uNative = matchUIntNative(1)
const m2uNative = matchUIntNative(4)
const m3uNative = matchUIntNative(14)

const func matchRune(x: Rune): Rune {
    match (x) {
        case r'A' | r'B' | r'C' => r'X'
        case r'\\' |  r'/' => r'|'
        case _ => r'\u{03B1}'
    }
}

const m1Rune = matchRune(r'A')
const m2Rune = matchRune(r'\\')
const m3Rune = matchRune(r'\'')

const func matchBool(x: Bool): Bool {
    match (x) {
        case true | false => true
        case _ => false
    }
}

const m1Bool = matchBool(true)
const m2Bool = matchBool(false)

const func matchOption(x: Option<Int32>): Bool {
    match (x) {
        case Some(_) => true
        case None => false
    }
}

const m1Option = matchOption(Some(0))
const m2Option = matchOption(None)

enum En {
    A | B | C | D | E
}

const func matchEnum(x: En): En {
    match (x) {
        case A | B => A
        case C | D => B
        case E => C
    }
}

const func matchEnum2(x: En): En {
    match (x) {
        case A => A
        case D => B
        case B => C
        case E => D
        case C => E
    }
}

const m1Enum = matchEnum(A)
const m2Enum = matchEnum(D)
const m3Enum = matchEnum(E)

const m1Enum2 = matchEnum2(A)
const m2Enum2 = matchEnum2(D)
const m3Enum2 = matchEnum2(E)

main(): Int64 {
    return 0
}


