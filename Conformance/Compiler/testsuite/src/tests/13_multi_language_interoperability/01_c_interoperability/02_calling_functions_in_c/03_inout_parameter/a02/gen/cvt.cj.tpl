/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         13_01_02_03_a02_{{num}}

  @Assertion:    13.1.2.3(2) The pass-by-reference expression is of type
                 CPointer<T>, where T is the type of the expression that
                 the inout expression modifies.

  @Description:  Use of inout modifier for parameter of type {{CJType}}.

  @Mode:         run

  @Negative:     no

  @Structure:    single

  @Issue:        0006353

  @Comment:      

*/

from utils import utils.assert.Assert

@c func func_01(Ptr: CPointer<{{CJType}}>): Unit {
    let Income = unsafe{ Ptr.read() }
    Assert.equals({{Val1}}, Income)
    unsafe{ Ptr.write({{Val2}}) }
}

main() {
    var Arg : {{CJType}} = {{Val1}};
    unsafe { func_01(inout: Arg) }
    Assert.equals({{Val2}}, Arg)
}
