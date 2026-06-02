// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt --int-overflow wrapping %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args
main() {
    var arr1: Array<Int64> = [1, 2, 3, 4]
    var testArr: Array<Int64> = arr1.clone(2..3)
    println(testArr)
    var res: Array<Int64> = [3]
    if (res == testArr) {
        return 0
    }
    return 1
}
