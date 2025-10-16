/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import pkg1.*

var a: Int64 = @Foo[1+](2+3)

// attribute macro without parentheses
@Foo[public]
struct Data {
    var count: Int64 = 100
}

main() {
    var data:Data = Data()
}
