// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package down

import up.C
import up.foo

main() {
    let v1 = C<Int64>()
    let v2 = C<Int64>()
    println(foo(v1))
}