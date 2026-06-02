/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:     17_01_a11_01

  @Level:         1

  @Assertion:  17.1(11) The same annotation class is allowed to be declared more than once for the same 
                annotation target.

  @Description:  check that you can use the same annotation for the same target more than once
  @Mode:         run
  @Negative:     no
  @Issue:        0006622

*/

@Annotation
public class TestA1101 {
    public const init() {}
}

@TestA1101
@TestA1101
class Foo {}

main() {}
