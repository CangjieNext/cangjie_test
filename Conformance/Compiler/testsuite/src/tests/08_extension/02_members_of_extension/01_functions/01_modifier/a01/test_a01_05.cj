/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        08_02_01_01_a01_05

  @Level:         1

  @Assertion:   8.2.1.1(1) Function definitions within extensions support the private, protected
                (only can be used when the extended type is a class type) or public modifier.

  @Description: Checks that protected modifier is not supported for Int64 extension functions.

  @Mode:        compileonly
  @Negative:    no
  @Structure:   single


*/

extend Int64 {
    protected func foo(): Int64 { 1 }
}

main() {
    return 0
}
