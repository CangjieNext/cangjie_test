/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         bug_0005826

  @Assertion:    Issue 0005826: Incorrect processing of `struct where` keyword combination
                  
  @Description:  Сheck that entity `struct` and keyword `where` have the same namespace.

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    single

  @Comment:      This bug affects test 03_01_a02_384 (auto-generated)

*/

struct where {}

main() {}
