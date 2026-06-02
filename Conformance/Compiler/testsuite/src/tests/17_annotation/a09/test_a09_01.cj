/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:     17_a09_01

  @Level:         1

  @Assertion:  17(9) Built-in annotations can only be defined by the compiler, mainly used for some specific functions,
               the scope of use of built-in annotations by the design of the feature is not limited to type 
               declarations and type declarations within.

  @Description:  Сheck that the built-in annotation defined by the compiler
  @Mode:         compileonly
  @Negative:     no

  @Issue: 0006421
*/

@C
func callableInC() {
    print("This function with built-in annotation")
    return 0
}

main() {}
