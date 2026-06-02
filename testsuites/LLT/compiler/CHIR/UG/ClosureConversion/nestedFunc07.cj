// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %f %enableCompileDebug -o %n.%suffix

open class Parent {
    static func parent_f() {
    }
}

class Test <: Parent {
    static func test() {
        let bar = parent_f
    }
}

main() {}
