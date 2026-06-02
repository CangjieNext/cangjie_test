// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt --int-overflow=wrapping %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT:scan 10
func throwException(a: Int64, b: Int64, c: Int64, d: Int64, e: Int64, f: Int64, g: Int64, h: Int64): Int64 {
    if (a + b + c + d + e + f + g + h > 100) {
        throw Exception()
    } else {
        throwException(a + 1, b + 1, c + 1, d + 1, e + 1, f + 1, g + 1, h + 1)
        print(20.toString())
    }
    return 1
}

main(): Int64 {
    try {
        throwException(10, 10, 2, 5, 10, 10, 10, 10)
        // error: dont throw exception
        print(20.toString())
    } catch (_) {
        print(10.toString())
        return 0
    }
    // error: dont catch exception
    print(30.toString())
    return 0
}
