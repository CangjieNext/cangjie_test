/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args

import std.convert.*

func formatUint8(int: Int64) {
    UInt8(int).format("+10")
}

func formatUint16(int: Int64) {
    UInt8(int).format("+10")
}

func formatUint32(int: Int64) {
    UInt8(int).format("+10")
}

func formatUint64(int: Int64) {
    UInt8(int).format("+10")
}

func formatint8(int: Int64) {
    Int8(int).format("+20")
}

func formatint16(int: Int64) {
    Int16(int).format("+20")
}

func formatint32(int: Int64) {
    Int32(int).format("+20")
}

main() {
    var count = 0
    try {
        let int = 256
        formatUint8(int)
    } catch (e: OverflowException) {
        count += 1
    }
    try {
        let int = -1
        formatUint8(int)
    } catch (e: OverflowException) {
        count += 1
    }
    try {
        let int = 65536
        formatUint16(int)
    } catch (e: OverflowException) {
        count += 1
    }
    try {
        let int = -1
        formatUint16(int)
    } catch (e: OverflowException) {
        count += 1
    }
    try {
        let int = 4294967296
        formatUint32(int)
    } catch (e: OverflowException) {
        count += 1
    }
    try {
        let int = -1
        formatUint32(int)
    } catch (e: OverflowException) {
        count += 1
    }
    try {
        let int = -1
        formatUint64(int)
    } catch (e: OverflowException) {
        count += 1
    }
    try {
        let int = 128
        formatint8(int)
    } catch (e: OverflowException) {
        count += 1
    }
    try {
        let int = -129
        formatint8(int)
    } catch (e: OverflowException) {
        count += 1
    }
    try {
        let int = 32768
        formatint16(int)
    } catch (e: OverflowException) {
        count += 1
    }
    try {
        let int = -32769
        formatint16(int)
    } catch (e: OverflowException) {
        count += 1
    }
    try {
        let int = 2147483648
        formatint32(int)
    } catch (e: OverflowException) {
        count += 1
    }
    try {
        let int = -2147483649
        formatint32(int)
    } catch (e: OverflowException) {
        count += 1
    }

    if (count == 13) { // Every type-conversion above throws exception.
        return 0
    }
    return 1
}
