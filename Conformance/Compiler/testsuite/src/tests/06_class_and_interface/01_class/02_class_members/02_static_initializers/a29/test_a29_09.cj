/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        06_01_02_02_a29_09

  @Level:         1

  @Assertion:   6.1.2.2(29) •Due to a static initializer is called automatically and there is no way to call it
                explicitly, the visibility modifier isn’t applicable to a static initializer, and it couldn’t be
                specified.
  @Description: Checks that class static initializer cannot be public.
  @Mode: compileonly
  @Negative: yes
  @Structure: single
  @CompileWarning: no
  @Issue: 6124

*/

class C {
    public static init() { }
}

main() { }
