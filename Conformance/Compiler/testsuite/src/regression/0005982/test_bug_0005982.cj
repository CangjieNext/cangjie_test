/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         bug_0005982
  @Assertion:    0005982: Wrong global variables init order.
  @Description:  Checks the source code example for the bug 0005982.
  @Mode:         run
  @Negative:     no
  @Structure:    complex-main
  @Dependencies: file1.cj file2.cj file3.cj file4.cj file5.cj init_common.cj
*/

package test

import init_order.Init

main() {
    vf32_51 = 5.5
    // Must be C1C2C3A1A2A3D1D2D3B1B2B3E1E2E3
    let initOrder = Init.getOrderString()
    if (initOrder == "C1C2C3A1A2A3D1D2D3B1B2B3E1E2E3") {
        return 0
    }
    // Got E1E2E3D1D2D3C1C2C3B1B2B3A1A2A3
    return 1
}

