/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            bug_0006644
  @Assertion:       Class "Some" and constructor enum Option "Some"

  @Description:     Check that the enum Option "Some" constructor can be redeclared according to Spec.

  @Mode:            run
  @Negative:        no
  @Structure:       single

  @Comment:         CompilerBug v0.38.2
*/

import utils.assert.Assert

class Some {
    init(_: Int64) {}
}

main() {
    let a: Option<Int64> = Some(1)
    let b: Some = Some(1) // error: unable to infer function type of the function call, please write it
                            // note: for function type '(Generics-T) -> Enum-Option<Generics-T>'
                            // ==> (package std/core)option.cj:8:5:
    let c: Some = default.Some(1)
    Assert.isTrue(a is Option<Int64>)
    Assert.isTrue(b is Some)
    Assert.isTrue(c is Some)
    Assert.isFalse(b is Option<Int64>)
    Assert.isFalse(c is Option<Int64>)
}
