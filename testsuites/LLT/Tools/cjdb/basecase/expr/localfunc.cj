// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

func f1(a: Int64) {
    func f2(a: Int64) {
        a
    }
    var f3 = f2
    return f2(1) //expr f2(1)
}

main() {
    f1(1)
    0
}
