/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.log.SimpleLogger

enum E<T> {
    | A
    func test() {
        let str = "Login success ,user is and ~!@#$%^&*()_+{hello}|[]\\-=`:\"?><,./ is"
        str
    }
}

main() {
    let a = E<String>()
    let str = a.test()
    SimpleLogger().debug(str)
    return 0
}
