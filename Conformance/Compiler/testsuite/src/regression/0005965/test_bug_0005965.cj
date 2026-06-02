/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:        bug_0005965

  @Assertion:   Internal Compiler Error: wrong call in DiagIllegalModifierInScope, astKind not support yet

  @Mode:        compileonly

  @Negative:    no

  @Issue:	0005965, 0005865

*/

main() {
   public var _ = 16
}
