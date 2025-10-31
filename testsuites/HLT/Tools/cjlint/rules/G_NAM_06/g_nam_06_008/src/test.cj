/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

private var a = 0
enum Foo {
    | E
}
extend Foo {
    public prop abc: Int64 {
        get() {
            println("get")
            a
        }
    }
}

main() {
    0
}

