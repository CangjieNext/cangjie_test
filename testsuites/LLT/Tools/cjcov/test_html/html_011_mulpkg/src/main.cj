// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

func func1(para: Int64): Int64 {
    let arrayTest: Array<Int64> = [0, 1, 2]
    try {
        let lastElement = arrayTest[2]
    } catch (_) {
        print("catch an exception!")
    }

    return para
}

main(): Int64 {
    func1(0)

    return 0
}
