// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

enum A {
    CC | AA | BB(S)
}

struct S {
    var b = 999
    var a = AA
    var c = 888
}

main() {
    var z = S()
    z.a = BB(z)
    return 0
}
