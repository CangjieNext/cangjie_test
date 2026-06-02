/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

main() {
    name<Bool>(false)
    0
}

func name<T>(a: T) {
    let ad1: (Int64, Int64) -> Int64 = {a: Int64, b: Int64 => a + b}
    let ad2 = ad1(1, 2)
    var test_lambda = {
        T: Int64, b: String => b
    }(1, "lambda")
}
