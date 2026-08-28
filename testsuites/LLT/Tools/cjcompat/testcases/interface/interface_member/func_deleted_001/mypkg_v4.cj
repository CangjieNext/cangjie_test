// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package myPkgA

 interface C1 {
    func f(x: String) : Int64
    func g(x: Int64) : String
}

 interface C2 <: C1 {
}

public interface C3 <: C2 {
}

 interface C4 {
    func f(x: String) : Int64 {
        1
    }
    func g(x: Int64) : String {
        "a"
    }
}

 open class C5 <: C4 {
}

public class C6 <: C5 {
}