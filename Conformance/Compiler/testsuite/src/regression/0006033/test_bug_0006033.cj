/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        bug_0006033
  @Description: Modifiers open and abstract should not be allowed together

  @Mode:        compileonly

  @Negative:    yes

  @Issue:       0006033

  @Structure:   single
*/

open abstract class A {}
class B <: A {}

main() {
  var b = B()
}
