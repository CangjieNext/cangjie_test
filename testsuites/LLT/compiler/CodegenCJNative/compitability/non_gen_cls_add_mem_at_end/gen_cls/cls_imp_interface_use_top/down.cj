// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package down

import up.C
import up.foo

func test() {
    foo<Int64>(C<Int64>())
}

main() {
    println(test())
}