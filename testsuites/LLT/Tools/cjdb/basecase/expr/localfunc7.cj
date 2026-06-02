// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

main() {
    let a: Int32 = 1
    func foo2() { var x = a; return x + 1 }
    var a2 = foo2() //expr foo2()
    0
}
