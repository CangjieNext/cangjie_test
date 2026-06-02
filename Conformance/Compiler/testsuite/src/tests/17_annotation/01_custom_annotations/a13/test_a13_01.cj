/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:     17_01_a13_01

  @Level:         1

  @Assertion:  17.1(13) Annotation is not inherited, so the annotation metadata for a type will only come from the
               annotation declared when it was defined. 

  @Description:  Сheck that the annotation metadata is not inherited
  @Mode:         compileonly
  @Negative:     yes
  @Issue:        0006622

*/

@Annotation
public class TestA1301 {
    public var id = 0 
    public const init() {
      this.id = 100
    }
}

@MyAnnotation
class Foo {}
class Bar <: Foo {}

main() {
    var obj = Bar()
    obj.id   
}
