// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

func foo(para: (Int64, Int64, Int64), para2!: (Int64, String) = (100, "KKK")) {
    var a = para
    return 0
}

main() {
    var v = (10, 50, 20)
    foo(v)
    0
}
