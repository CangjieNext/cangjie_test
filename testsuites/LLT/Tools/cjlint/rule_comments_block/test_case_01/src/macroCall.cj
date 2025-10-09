// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package macro_calling  /* cjlint-ignore     !G.NAM.02 */

import macro_definition.*

/* cjlint-ignore   -start  !G.OTH.03 */
main(): Int64 {
    println("macro call test")
    let a: Int64 = @TestDef(1 + 2)
    println("a = ${a}")
    // https://cangjie-lang.cn/pages/LICENSE
    return 0
}
// cjlint-ignore   -end
