// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %enableCompileDebug %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

main() {
    let a = [0, 1, 2, 3, 4]
    a[4] = 5
    if (a[3] != 3 || a[4] != 5) {
        return 1
    }
    let b = createDouble()
    if (b[0][0] != 10 || b[0][1] != 20 || b[1][0] != 30 || b[1][1] != 40) {
        return 1
    }
    return 0
}

func get(arr: Array<Int16>): Int16 {
    // # IR : 1
    return arr[3]
}

func put(arr: Array<Int16>, value: Int16) {
    // # IR : 2
    arr[3] = value
}

func putDouble(arr: Array<Array<Int16>>, value: Int16) {
    // # IR : 3
    arr[3][5] = value
}

func len(arr: Array<Int16>): Int64 {
    // # IR : 4
    return arr.size
}

func create(): Array<Int16> {
    // # IR : 5
    return [10, 20]
}

func createDouble(): Array<Array<Int16>> {
    // # IR : 6
    return [[10, 20], [30, 40]]
}

func createZero(): Array<Int16> {
    // # IR : 7
    return Array<Int16>(10, repeat: 0)
}

func createNonZero(): Array<Int16> {
    // # IR : 8
    return Array<Int16>(10, repeat: 37)
}

func pass(arr: Array<Int16>): Unit {
    // # IR : 9
    pass(arr)
}
