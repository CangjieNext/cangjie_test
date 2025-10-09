import std.log.SimpleLogger

struct S<T> {
    func test<T>() {
        let str = "Login success ,user is and ~!@#$%^&*()_+{hhhh}|[]\\-=`:\"?><,./ is"
        str
    }
}

main() {
    let a = S<String>().test(String)
    SimpleLogger().debug(str)
    return 0
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
