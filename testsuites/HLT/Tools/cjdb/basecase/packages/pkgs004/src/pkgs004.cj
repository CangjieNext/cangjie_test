/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */






import {pkgs1.foo, pkgs1}              // 遮盖
import {pkgs2.foo, pkgs2}             // 遮盖


func foo(a: Int64) {
    return a
}        // f5

main() {
    let a: Int64 = 1
    let b: Int64 = pkgs1.foo(a)                 // 对于pkgs1中{f1, f2}进行重载决议.
    let c: Int64 = pkgs2.foo(a)                 // 对于pkgs2中{f3, f4}进行重载决议.
    let d: Int64 = foo(a)                      // 对于{f1, f2, f3, f4, f5}进行重载决议.
    return 1
}
