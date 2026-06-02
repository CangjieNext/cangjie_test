// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

class C {
    let m1: Int64
    init(a: Int64, b: Int64) {
        m1 = a
        if (b > 0) {
            m1 = a * b
        }
    }
    ~init() {}
    //ABC
}