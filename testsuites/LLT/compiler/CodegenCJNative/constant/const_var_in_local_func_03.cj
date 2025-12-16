// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

main() {
    let f1 = {
        a: Int64, b: Int64 =>
            func func1(aaa: Int64, bbb!: Int64 = 1) {
                const var1: String = "a"
            }

            if (true) {
                func func1(aaa: Int64, bbb!: Int64 = 2) {
                    const var1: String = ("a", 1)[0]
                }
            }
            1
    }

    return 0
}