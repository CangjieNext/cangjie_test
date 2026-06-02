// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args

/* Test condition: Testing left shift operation when bitwidth of right operand is less than the bitwidth of left operand.*/
func int64ToInt32() {
    var a: Int64 = 12
    var c: Int32 = 1
    return (a << c) - 24
}

func int64ToInt16() {
    var a: Int64 = 12
    var c: Int16 = 1
    return (a << c) - 24
}

func int64ToInt8() {
    var a: Int64 = 12
    var c: Int8 = 1
    return (a << c) - 24
}

func int32ToInt16() {
    var a: Int32 = 12
    var c: Int16 = 1
    return (a << c) - 24
}

func int32ToInt8() {
    var a: Int32 = 12
    var c: Int8 = 1
    return (a << c) - 24
}

func int16ToInt8() {
    var a: Int16 = 12
    var c: Int8 = 1
    return (a << c) - 24
}

main() {
    if (int64ToInt32() != 0) {
        return 1
    }
    if (int64ToInt16() != 0) {
        return 2
    }
    if (int64ToInt8() != 0) {
        return 3
    }
    if (int32ToInt16() != 0) {
        return 4
    }
    if (int32ToInt8() != 0) {
        return 5
    }
    if (int16ToInt8() != 0) {
        return 6
    }
    return 0
}
