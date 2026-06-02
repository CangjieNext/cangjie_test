/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:     17_01_a10_01

  @Level:         1

  @Assertion:  17.1(10) 
                @Annotation
                public class MyAnnotation {... }

                @MyAnnotation // ok
                class Foo {}

  @Description:  Check example
  @Mode:         compileonly
  @Negative:     no
  @Issue:        0006622

*/

@Annotation
public class TestA1001 {
    public const init() {}
}

@TestA1001 // ok
class Foo {}

main() {}
