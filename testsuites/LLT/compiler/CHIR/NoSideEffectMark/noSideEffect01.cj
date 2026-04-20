// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC-PIPE-0: %compiler %cmp_opt %f %dumpCHIRDebug -o %output
// EXEC-PIPE-0: %cat %n\_CHIR/[0-9]*\_Canonicalization.chirtxt | compare %f

// extend Ordering { public func compare(other: Ordering): Ordering { ... } }
// ASSERT: regex-begin \[noSideEffect\].* @_CNatXNNat8OrderingE7compareHY1_\(
// ASSERT: regex-next .*\[this\]: Enum-_CNat8OrderingE
// ASSERT: regex-next .*\[other\]: Enum-_CNat8OrderingE
// ASSERT: regex-next \): Enum-_CNat8OrderingE // .*loc: "comparable.cj".*packageName: std.core

// extend Int64 { public func hashCode(): Int64 { ... } }
// ASSERT: regex-begin \[noSideEffect\].* @_CNatXl8hashCodeHv\(
// ASSERT: regex-next .*\[this\]: Int64
// ASSERT: regex-next \): Int64 // .*loc: "hashable.cj".*packageName: std.core

// extend Float64 { public func hashCode(): Int64 { ... } }
// ASSERT: regex-begin \[noSideEffect\].* @_CNatXd8hashCodeHv\(
// ASSERT: regex-next .*\[this\]: Float64
// ASSERT: regex-next \): Int64 // .*loc: "hashable.cj".*packageName: std.core

// struct String { public func compare(str: String): Ordering { ... } }
// ASSERT: regex-begin \[noSideEffect\].* @_CNat6String7compareHRNatY0_E\(
// ASSERT: regex-next .*\[this\]: Struct-_CNat6StringE
// ASSERT: regex-next .*\[str\]: Struct-_CNat6StringE
// ASSERT: regex-next \): Enum-_CNat8OrderingE // .*loc: "string.cj".*packageName: std.core

// struct String { public operator const func ==(other: String): Bool { ... } }
// ASSERT: regex-begin \[noSideEffect\].* @_CNat6StringeqHRNatY0_E\(
// ASSERT: regex-next .*\[this\]: Struct-_CNat6StringE
// ASSERT: regex-next .*\[other\]: Struct-_CNat6StringE
// ASSERT: regex-next \): Bool // .*loc: "string.cj".*packageName: std.core

// public func round(x: Float64): Float64 { ... }
// ASSERT: regex-begin \[noSideEffect\].* @_CNbg5roundHd\(
// ASSERT: regex-next .*\[x\]: Float64
// ASSERT: regex-next \): Float64 // .*loc: "math_funcs.cj".*packageName: std.math

// public func round(x: Float32): Float32 { ... }
// ASSERT: regex-begin \[noSideEffect\].* @_CNbg5roundHf\(
// ASSERT: regex-next .*\[x\]: Float32
// ASSERT: regex-next \): Float32 // .*loc: "math_funcs.cj".*packageName: std.math

// public func round(x: Float16): Float16 { ... }
// ASSERT: regex-begin \[noSideEffect\].* @_CNbg5roundHDh\(
// ASSERT: regex-next .*\[x\]: Float16
// ASSERT: regex-next \): Float16 // .*loc: "math_funcs.cj".*packageName: std.math

import std.math.*

main() {
    round(0.01f16)
    round(0.01f32)
    round(0.01f64)
    0
}