/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Assertion: The members in the primary constructor can also be modified by using private, public, and protected.

  @Description: Definition of a classes with public and protected parameters for the postive test

  @Structure: complex-aux
*/

package t03

public class TestPublic {
  public TestPublic(
    public var p1: Int64,
    public let p2: String,
    public var np1!: Rune,
    public let np2!: () -> String
  ) {}
}

public open class TestProtected {
  public TestProtected(
    protected var p1: Int64,
    protected let p2: String,
    protected var np1!: Rune,
    protected let np2!: () -> String
  ) {}
}
