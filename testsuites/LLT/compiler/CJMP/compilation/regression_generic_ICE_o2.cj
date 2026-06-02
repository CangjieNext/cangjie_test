// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
// LEVEL 0
// EXEC: %compiler %f --experimental --output-type chir -O2

package cmp

class A {
    func foo() {
        wrap<String>("2")
    }

    private static func wrap<T>(value: ?T): String {
        match (value) {
            case Some(v: String) => v
            case Some(v: Int) => v.toString()
            case None => "x"
            case _ => "unknown"
        }
    }
}
