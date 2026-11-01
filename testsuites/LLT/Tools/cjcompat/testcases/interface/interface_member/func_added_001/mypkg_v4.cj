// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package myPkgA

 interface C2 {
    func k(x: Float16) : Float32
}

 interface C1 <: C2 {
}

public interface C0 <: C1 {
}

 interface C3 {
    func k(x: Float16) : Float32 {
        1.0
    }
}

 open class C4 <: C3 {
}

public class C5 <: C4 {
}