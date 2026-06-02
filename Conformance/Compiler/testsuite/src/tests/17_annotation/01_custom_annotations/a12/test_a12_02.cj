/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:     17_01_a12_02

  @Level:         1

  @Assertion:  17.1(12)
                @MyAnnotation
                @MyAnnotation
                class Foo {}
                @MyAnnotation
                @C
                @MyAnnotation2
                func f(){}


  @Description:  Check example
  @Mode:         run
  @Negative:     no
  @Issue:        0006622

*/

@Annotation
public class TestA1202 {
    public const init() {}
}

@TestA1202
@TestA1202
class Foo {}

main() {}
