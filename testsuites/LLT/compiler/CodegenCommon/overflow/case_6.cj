// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan-20 OverflowException: add

internal import std.math.*
internal import std.overflow.*

func check<T>(action: () -> T) {
    try {
        action()
    } catch (e: OverflowException) {
        println(e)
    }
}

var v8: Int8 = Int8.Max
var v16: Int16 = Int16.Max
var v32: Int32 = Int32.Max
var v64: Int64 = Int64.Max
var intNative: IntNative = IntNative.Max
var ui8: UInt8 = UInt8.Max
var ui16: UInt16 = UInt16.Max
var ui32: UInt32 = UInt32.Max
var ui64: UInt64 = UInt64.Max
var uintNative: UIntNative = UIntNative.Max

main() {
    check<Int8>(
        {
            =>
            var v = v8;
            v++;
            return v
        }
    )
    check<Int16>(
        {
            =>
            var v = v16;
            v++;
            return v
        }
    )
    check<Int32>(
        {
            =>
            var v = v32;
            v++;
            return v
        }
    )
    check<Int64>(
        {
            =>
            var v = v64;
            v++;
            return v
        }
    )
    check<IntNative>(
        {
            =>
            var v = intNative;
            v++;
            return v
        }
    )
    check<UInt8>(
        {
            =>
            var v = ui8;
            v++;
            return v
        }
    )
    check<UInt16>(
        {
            =>
            var v = ui16;
            v++;
            return v
        }
    )
    check<UInt32>(
        {
            =>
            var v = ui32;
            v++;
            return v
        }
    )
    check<UInt64>(
        {
            =>
            var v = ui64;
            v++;
            return v
        }
    )
    check<UIntNative>(
        {
            =>
            var v = uintNative;
            v++;
            return v
        }
    )

    check<Int8>(
        {
            =>
            var v = v8;
            v.throwingInc();
            return v
        }
    )
    check<Int16>(
        {
            =>
            var v = v16;
            v.throwingInc();
            return v
        }
    )
    check<Int32>(
        {
            =>
            var v = v32;
            v.throwingInc();
            return v
        }
    )
    check<Int64>(
        {
            =>
            var v = v64;
            v.throwingInc();
            return v
        }
    )
    check<IntNative>(
        {
            =>
            var v = intNative;
            v.throwingInc();
            return v
        }
    )
    check<UInt8>(
        {
            =>
            var v = ui8;
            v.throwingInc();
            return v
        }
    )
    check<UInt16>(
        {
            =>
            var v = ui16;
            v.throwingInc();
            return v
        }
    )
    check<UInt32>(
        {
            =>
            var v = ui32;
            v.throwingInc();
            return v
        }
    )
    check<UInt64>(
        {
            =>
            var v = ui64;
            v.throwingInc();
            return v
        }
    )
    check<UIntNative>(
        {
            =>
            var v = uintNative;
            v.throwingInc();
            return v
        }
    )
    return 0
}
