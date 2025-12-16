// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


class CA<T> {
    public func foo() {
        func func1<T>() {
            const var1: String = "a"
            0
        }

        if (true) {
            func func1<T>() {
                const var1: String = ("a", 1)[0]
                1
            }
        }
    }
}

main() {
    CA<Int64>().foo()
    return 0
}
