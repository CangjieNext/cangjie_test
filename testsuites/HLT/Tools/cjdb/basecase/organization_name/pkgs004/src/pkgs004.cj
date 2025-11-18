/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import a1::{pkgs1.foo, pkgs1}
import a1::{pkgs2.foo, pkgs2}


func foo(a: Int64) {
    return a
}

main() {
    let a: Int64 = 1
    let b: Int64 = pkgs1.foo(a)
    let c: Int64 = pkgs2.foo(a)
    let d: Int64 = foo(a)
    return 1
}
