/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

class B {
    static var name = "YYY"
    static func foo() {
        var name = "Zhang"
        println(name)
    }
}
main() {
    B.foo()
    0
}

