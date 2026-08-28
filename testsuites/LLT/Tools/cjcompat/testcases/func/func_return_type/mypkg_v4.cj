// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package myPkgA

public interface I {
    func foo() {42}
}

extend Int64 <: I {}

// V0
public func sum(b: Int64, a:Int64) : Int64 {
    a+b
}

main() {}