// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package tmp
func foo<T>() {
    func goo<T>() {
       println("It's goo")
    }
    func hoo() {
        func loo<T>() {
                goo<Int64>()
        }
        loo<Int32>()
    }
    hoo()
}

main() {
    foo<Float16>()
}