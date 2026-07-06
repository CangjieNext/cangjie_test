// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package com.java.lib

common class Child {
    init() {
        // implicit super() call to Object
        print("Child init\n", flush: true)
    }
}

common class Child2 {
    init() {
        // explicit super() call to Object
        super()
        print("Child2 init\n", flush: true)
    }
}
