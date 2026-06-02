// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

main() {
    const b = 600
    func foo<T1, T2>() {
        func goo<T3, T4>() {
            const a = 500
        }
        goo<Int64, Int32>()
    }
    foo<Int32, Int64>()
    return 0
}
