/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package mp

common class A {
    common A()
    common init(a: String) {}
    common init(a: Bool) {}
    init(a: Bool,b:Int64) {}
}

common struct S {
    common S()
    common init(a: String) {}
    common init(a: Bool) {}
    init(a: Bool,b:Int64) {}
}