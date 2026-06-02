// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

enum E2 {
    C | D(Int64)
}

func f1(a: E2) {
    a
}

main() {
    var a = E2.C
    var b = f1(C)
    return 0
}
