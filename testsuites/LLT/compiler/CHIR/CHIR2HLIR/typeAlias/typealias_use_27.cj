// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

type arr<T> = Array<Int64>

type arr1<T> = Array<Array<Int64>>

let f1: (arr<Int64>) -> arr<Rune> = {a: arr<Unit> => a}

main(): Int64 {
    let a: Array<Int64> = [1, 2]
    let b: arr1<String> = arr1<String>(2, repeat: a)
    let c: arr<Int64> = [1, 2]
    let d: arr<String> = [1, 2]
    if (f1(c)[0] + f1(d)[1] == 3) {
        return 0
    } else {
        return 1
    }
}
