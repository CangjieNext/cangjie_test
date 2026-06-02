/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package macro_calling

import macro_calling.macro_definition_1.*
import macro_calling.macro_definition_2.*

main(): Int64 {
    println("I'm in function body")
    let a: Int64 = @TestDef_1(1 + 2)
    let b: Int64 = @TestDef_2(1 + 2)
    return 0
}
