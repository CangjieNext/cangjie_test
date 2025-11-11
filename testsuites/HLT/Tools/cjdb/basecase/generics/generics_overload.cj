/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

class A<T> {
    operator func [](arg1: Int64, arg2: String): Int64 {
        return 8
    }
}

main() {
    let a = A<Int64>()
    let b: Int64 = a[1, "2"]
}
