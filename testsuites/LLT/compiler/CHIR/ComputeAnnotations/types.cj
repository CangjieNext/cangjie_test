// EXEC: %compiler %f --debug-annotations
// test no core dumped

import std.sync.*

@Annotation
public class CustomAnnotation {
    public const CustomAnnotation(
        let a: String
    ) {}
}


class TM {
    static let CURR = AtomicInt64(0)
}
class J {
    init() {}
    let f = Box(3)
}

class HF {
    public static let gm = HF()
    const init() {}
}
type KK = UInt8
type KM = String
type KM2 = J 


interface i1 {}
class C1 <: i1 {
    const init() {}
}

class test_prop {
    prop h1: Int64 {
        get() {
            let _ = TM.CURR
            32
        }
    }
}

main() {}


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
