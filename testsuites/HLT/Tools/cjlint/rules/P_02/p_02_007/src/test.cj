/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

struct Demo<T> {
    static var res: Int8 = 1
}

func test<T>() {
    for (i in 0..10) {
        spawn {
          Demo<Int8>.res++
        }
    }
}

main(): Int64 {
    return 0
}
