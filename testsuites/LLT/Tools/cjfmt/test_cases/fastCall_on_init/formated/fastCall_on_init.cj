// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

struct MyObject1 {
    @FastCall
    public init() {
        let a = 1
    }
}

class MyObject {
    @FastCall
    public init() {
        let a = 1
    }
}

main(): Unit {
    let m = MyObject()
    let n = MyObject1()
}
