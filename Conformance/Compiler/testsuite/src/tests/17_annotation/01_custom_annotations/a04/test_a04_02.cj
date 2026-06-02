/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:     17_01_a04_02

  @Level:         1

  @Assertion:  17.1(4) An @Annotation can only modify a class, and not a class modified by abstract or open or sealed.

  @Description:  Сheck that the @Annotation can`t modify a open class
  @Mode:         compileonly
  @Negative:     yes
  @Issue:        0006622

*/

@Annotation
public class TestA0402 {
    public var id: Int64 = 0
    public const init() {}
}

@TestA0402
open class Foo {}

main() {}
