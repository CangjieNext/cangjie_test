// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package myPkgA

// V1
public enum S {
    | ERROR

    public func level(): Int32 {
        let num = match (this) {
            case ERROR => 0
        }
        return Int32(num)
    }
}

func foo(x: S) {
  x
}

main() {}