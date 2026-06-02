// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

enum E {
    I(Int8) | I(Int16, Int32) | I(Int64, String, Array<Int64>)
}

main() {
    var e1 = E.I(5)
    var e2 = E.I(55, 555)
    var e3 = E.I(5555, "HH", [5, 6, 7])
    return 0
}
