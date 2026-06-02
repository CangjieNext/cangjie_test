// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
main() {
    var aaa = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    println("aaa=${aaa}==${aaa.size}")
    if (aaa.size != 10) {
        return 10
    }
    aaa = aaa[1..]
    println("aaa=${aaa}==${aaa.size}")
    if (aaa.size != 9) {
        return 9
    }
    aaa = aaa[1..]
    println("aaa=${aaa}==${aaa.size}")
    if (aaa.size != 8) {
        return 8
    }
    aaa = aaa[1..]
    println("aaa=${aaa}==${aaa.size}")
    if (aaa.size != 7) {
        return 7
    }
    aaa = aaa[1..]
    println("aaa=${aaa}==${aaa.size}")
    if (aaa.size != 6) {
        return 6
    }
    aaa = aaa[1..]
    println("aaa=${aaa}==${aaa.size}")
    if (aaa.size != 5) {
        return 5
    }
    aaa = aaa[1..]
    println("aaa=${aaa}==${aaa.size}")
    if (aaa.size != 4) {
        return 4
    }
    aaa = aaa[1..]
    println("aaa=${aaa}==${aaa.size}")
    if (aaa.size != 3) {
        return 3
    }
    aaa = aaa[1..]
    println("aaa=${aaa}==${aaa.size}")
    if (aaa.size != 2) {
        return 2
    }
    aaa = aaa[1..]
    println("aaa=${aaa}==${aaa.size}")
    if (aaa.size != 1) {
        return 1
    }
    return 0
}
