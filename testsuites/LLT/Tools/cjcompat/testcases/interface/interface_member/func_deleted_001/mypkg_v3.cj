// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package myPkgA

 interface C1 {
    func f(x: String) : Int64
}

public interface C2 <: C1 {
}

 interface C3 {
    func g(x: Int64) : String {
        "a"
    }
}

public class C4 <: C3 {
}
