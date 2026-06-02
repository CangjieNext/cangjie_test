// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan-10 OverflowException: sub

internal import std.math.*
internal import std.overflow.*

func check<T>(action: () -> T) {
    try {
        action()
    } catch (e: OverflowException) {
        println(e)
    }
}

var i8: Int8 = Int8.Min
var i16: Int16 = Int16.Min
var i32: Int32 = Int32.Min
var i64: Int64 = Int64.Min
var intNative: IntNative = IntNative.Min
var ui8: UInt8 = UInt8.Max
var ui16: UInt16 = UInt16.Max
var ui32: UInt32 = UInt32.Max
var ui64: UInt64 = UInt64.Max
var uintNative: UIntNative = UIntNative.Max

main() {
    check<Int8>(
        {
            =>
            var v = i8;
            v.throwingNeg();
            return v
        }
    )
    check<Int16>(
        {
            =>
            var v = i16;
            v.throwingNeg();
            return v
        }
    )
    check<Int32>(
        {
            =>
            var v = i32;
            v.throwingNeg();
            return v
        }
    )
    check<Int64>(
        {
            =>
            var v = i64;
            v.throwingNeg();
            return v
        }
    )
    check<IntNative>(
        {
            =>
            var v = intNative;
            v.throwingNeg();
            return v
        }
    )
    check<UInt8>(
        {
            =>
            var v = ui8;
            v.throwingNeg();
            return v
        }
    )
    check<UInt16>(
        {
            =>
            var v = ui16;
            v.throwingNeg();
            return v
        }
    )
    check<UInt32>(
        {
            =>
            var v = ui32;
            v.throwingNeg();
            return v
        }
    )
    check<UInt64>(
        {
            =>
            var v = ui64;
            v.throwingNeg();
            return v
        }
    )
    check<UIntNative>(
        {
            =>
            var v = uintNative;
            v.throwingNeg();
            return v
        }
    )
    return 0
}
