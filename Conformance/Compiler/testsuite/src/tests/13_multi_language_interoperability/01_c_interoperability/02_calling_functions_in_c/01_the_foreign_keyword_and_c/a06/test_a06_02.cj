/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         13_01_02_01_a06_02

  @Level:         1

  @Assertion:    13.1.2.1(6)  Under @C modifier, the foreign keyword only allows
                 modify non-generic functions in the top-level scope.

  @Description:  @C + generic function in foreign block.

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    single

  @Comment:      

  @Issue: 0006421
*/

foreign {
    @C func ABC<T1>(x : Int32) : Int32 { x }
}

main() {
    ABC<Int32>(0);
}
