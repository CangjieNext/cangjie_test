/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Structure:    complex-aux
  @Dependencies: aux_test_a06_01.cj
*/

package pkga3

import pkga1.E1

public func f1() : E1 { 
    let e = E1.FVal(20.23)
    return e
}

public func f2(p: E1) {
    var e = p
}