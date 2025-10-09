// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package b

import b.define_30001.X as x

@x
var x = 1

@x
class c {}

@x
interface i {}

@x
enum e {
    e
}

main() {
    @x @x(0)
}
