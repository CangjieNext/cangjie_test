/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:     17_01_a05_02

  @Level:         1

  @Assertion:  17.1(5) When a class declares that it is annotated with @Annotation, it must provide at least 
               one const init function or the compiler will report an error.

  @Description:  Сheck that the annotated class without const init function does cause an error
  @Mode:         compileonly
  @Negative:     yes
  @Issue:        0006622

*/

@Annotation
public class TestA0502 {
    public var id: Int64 = 0
}

@TestA0502
class Foo {}

main() {}
