// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

func test(a: Int64, b: Int64) {
    let c = 555
    var e = 555
    var d = a + b + c
    return d
}

main(): Int64 {
    var d = test(1, 2)
    return 0
}
