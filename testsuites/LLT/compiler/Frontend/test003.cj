// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package pkg1

class C {
    public func render(regex: Int64) {
        let idx = regex
        match (idx) {
            case 0 => print("0")
            case 1 => print("1")
            case 2 => print("2")
            case _ => print("-1")
        }
    }
}
