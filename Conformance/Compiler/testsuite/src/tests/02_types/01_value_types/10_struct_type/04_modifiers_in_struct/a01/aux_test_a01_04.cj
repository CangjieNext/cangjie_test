/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Description:     Defines a struct visible only in the current package and tests it visibility.

  @Structure:       complex-aux
  @CompileWarning:  no
*/

package p4

import utils.assert.Assert

struct S {
    func f() { Assert.isTrue(true) }
}

public func test() {
    S().f()
}
