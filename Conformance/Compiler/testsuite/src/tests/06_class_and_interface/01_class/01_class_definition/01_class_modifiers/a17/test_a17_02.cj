/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        06_01_01_01_a17_02

  @Level:         1

  @Assertion:   6.1.1.1(17) –Subclasses of sealed may not be modified by public.
  @Description: Checks that public subclass of sealed abstract class is not allowed.
  @Mode: compileonly
  @Negative: no
  @Structure: single
  @CompileWarning: no
  @Issue: 6083, 6084

*/

sealed abstract class A { }

class B <: A { }

main() { }
