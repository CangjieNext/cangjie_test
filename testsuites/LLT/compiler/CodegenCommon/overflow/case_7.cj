// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan-20 OverflowException: sub

internal import std.math.*
internal import std.overflow.*

func check<T>(action: () -> T) {
    try {
        action()
    } catch (e: OverflowException) {
        println(e)
    }
}

var v8: Int8 = Int8.Min
var v16: Int16 = Int16.Min
var v32: Int32 = Int32.Min
var v64: Int64 = Int64.Min
var intNative: IntNative = IntNative.Min
var ui8: UInt8 = UInt8.Min
var ui16: UInt16 = UInt16.Min
var ui32: UInt32 = UInt32.Min
var ui64: UInt64 = UInt64.Min
var uintNative: UIntNative = UIntNative.Min

main() {
    check<Int8>(
        {
            =>
            var v = v8;
            v--;
            return v
        }
    )
    check<Int16>(
        {
            =>
            var v = v16;
            v--;
            return v
        }
    )
    check<Int32>(
        {
            =>
            var v = v32;
            v--;
            return v
        }
    )
    check<Int64>(
        {
            =>
            var v = v64;
            v--;
            return v
        }
    )
    check<IntNative>(
        {
            =>
            var v = intNative;
            v--;
            return v
        }
    )
    check<UInt8>(
        {
            =>
            var v = ui8;
            v--;
            return v
        }
    )
    check<UInt16>(
        {
            =>
            var v = ui16;
            v--;
            return v
        }
    )
    check<UInt32>(
        {
            =>
            var v = ui32;
            v--;
            return v
        }
    )
    check<UInt64>(
        {
            =>
            var v = ui64;
            v--;
            return v
        }
    )
    check<UIntNative>(
        {
            =>
            var v = uintNative;
            v--;
            return v
        }
    )

    check<Int8>(
        {
            =>
            var v = v8;
            v.throwingDec();
            return v
        }
    )
    check<Int16>(
        {
            =>
            var v = v16;
            v.throwingDec();
            return v
        }
    )
    check<Int32>(
        {
            =>
            var v = v32;
            v.throwingDec();
            return v
        }
    )
    check<Int64>(
        {
            =>
            var v = v64;
            v.throwingDec();
            return v
        }
    )
    check<IntNative>(
        {
            =>
            var v = intNative;
            v.throwingDec();
            return v
        }
    )
    check<UInt8>(
        {
            =>
            var v = ui8;
            v.throwingDec();
            return v
        }
    )
    check<UInt16>(
        {
            =>
            var v = ui16;
            v.throwingDec();
            return v
        }
    )
    check<UInt32>(
        {
            =>
            var v = ui32;
            v.throwingDec();
            return v
        }
    )
    check<UInt64>(
        {
            =>
            var v = ui64;
            v.throwingDec();
            return v
        }
    )
    check<UIntNative>(
        {
            =>
            var v = uintNative;
            v.throwingDec();
            return v
        }
    )
    return 0
}
