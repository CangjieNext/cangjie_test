// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-0: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan tmp.size=8
// ASSERT: scan 1234100000

func foo<T>(value: T, arr: Array<T>): Array<T> {
    var insideSize = arr.size
    try {
        let arr2 = Array<T>(insideSize * 2, repeat: unsafe { zeroValue<T>() })
        arr.copyTo(arr2, 0, 0, insideSize)
        arr2[insideSize] = value
        return arr2
    } catch (e: Exception) {
        e.printStackTrace()
        return []
    }
}

main() {
    var tmp = foo<Int64>(100, [1, 2, 3, 4])
    println("tmp.size=${tmp.size}")
    for (item in tmp) {
        print(item)
    }
    return 0
}
