// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

class ABC {
    var a = "123"
    var b = 3
}

enum E2 {
    A | B(ABC)
}

var glo_cls = E2.B(ABC())

main() {
    var cls = ABC()
    var zz = E2.B(cls)
    0
}
