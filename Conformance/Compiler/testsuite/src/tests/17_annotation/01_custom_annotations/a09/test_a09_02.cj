/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:     17_01_a09_02

  @Level:         1

  @Assertion:  17.1(9) 2.It is permitted to omit the parentheses when declaring annotated types that have a
                parameterless constructor.

  @Description:  Check that the parentheses may not be omitted if annotated types that have not a
                 parameterless constructor
  @Mode:         compileonly
  @Negative:     yes
  @Issue:        0006622

*/

@Annotation
public class TestA0902 {
    public var id = 0 
    public const init(id: Int64) {
      this.id = id
    }
}

@TestA0902
class Foo {}

main() {}
