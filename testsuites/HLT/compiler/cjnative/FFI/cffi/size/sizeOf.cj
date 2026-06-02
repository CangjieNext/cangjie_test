/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL:2
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

@C
struct Data {
    var a: UInt8 = 0
    var b: UInt16 = 0
    var c: UInt32 = 0
    var d: UInt64 = 0
    var e: Int8 = 0
    var f: Int16 = 0
    var g: Int32 = 0
    var h: Int64 = 0
}

main() {
    if (sizeOf<Unit>() != 0) {
        return 1
    }

    if (sizeOf<UInt8>() != 1) {
        return 1
    }
    if (sizeOf<UInt16>() != 2) {
        return 1
    }
    if (sizeOf<UInt32>() != 4) {
        return 1
    }
    if (sizeOf<UInt64>() != 8) {
        return 1
    }
    if (sizeOf<Int8>() != 1) {
        return 1
    }
    if (sizeOf<Int16>() != 2) {
        return 1
    }
    if (sizeOf<Int32>() != 4) {
        return 1
    }
    if (sizeOf<Int64>() != 8) {
        return 1
    }
    if (sizeOf<Data>() != 32) {
        return 1
    }

    if (sizeOf<Float32>() != 4) {
        return 1
    }
    if (sizeOf<Float64>() != 8) {
        return 1
    }

    if (sizeOf<CString>() != 8) {
        return 1
    }
    if (sizeOf<CPointer<Int8>>() != 8) {
        return 1
    }
    if (sizeOf<CFunc<(CPointer<Int8>) -> Unit>>() != 8) {
        return 1
    }
    return 0
}
