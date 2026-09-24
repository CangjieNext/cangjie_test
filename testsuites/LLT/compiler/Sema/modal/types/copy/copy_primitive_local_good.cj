// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Primitive types (Bool, integer family, Float32/Float64, Unit) are copy types:
// their @local! parameter may be referenced from a default-value expression, since a
// copy type value can be copied out of the local region. Non copy types must not be
// referenced this way and report sema_bad_capture_local (see ref_local_full_noncopy_bad.cj).

// EXEC: %compiler %cmp_opt %f -Woff all -o %output
// EXEC: %run %run_opt %output | compare %f

func boolCopy(x: Bool @local!, y!: Bool = x): Bool {
    y
}

func intCopy(x: Int64 @local!, y!: Int64 = x): Int64 {
    y
}

func uintCopy(x: UInt64 @local!, y!: UInt64 = x): UInt64 {
    y
}

func float32Copy(x: Float32 @local!, y!: Float32 = x): Float32 {
    y
}

func float64Copy(x: Float64 @local!, y!: Float64 = x): Float64 {
    y
}

func unitCopy(x: Unit @local!, y!: Unit = x): Unit {
    y
}

main() {
    println(boolCopy(true))
    println(intCopy(42))
    println(uintCopy(7))
    println(float32Copy(1.5))
    println(float64Copy(2.5))
    unitCopy(())
}

/* SCAN
true
42
7
1.500000
2.500000
*/
