/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package diagnosticsTest.dts_error
import diagnosticsTest.dts_error.macro_pkg.TestDef

func testdts03() {
    @TestDef(let a = 1)
    let b = @TestDef(1)
    let c = @TestDef(b + 1)
}
