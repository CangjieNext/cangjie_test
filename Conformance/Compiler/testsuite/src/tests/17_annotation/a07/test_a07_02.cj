/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:     17_a07_02

  @Level:         1

  @Assertion:  17(7) Annotations are divided into custom annotations and built-in annotations.

  @Description:  Сheck that built-in annotation can be used
  @Mode:         compileonly
  @Negative:     no

*/

@C
func callableInC() {
    print("This function with built-in annotation")
}

main() {}
