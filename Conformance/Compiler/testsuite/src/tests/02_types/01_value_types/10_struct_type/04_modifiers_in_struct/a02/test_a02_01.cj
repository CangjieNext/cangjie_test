/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            02_01_10_04_a02_01

  @Level:         1
  @Assertion:       2.1.10.4(2) The visibility of struct members can be controlled by the visibility modifiers public
                    or private. In addition, static members can be declared using the static modifier.

  @Description:     Check that struct members can be modified with the "public" modifier.

  @Mode:            compileonly
  @Negative:        no
  @Structure:       single
  @CompileWarning:  no

  @Issue: 0006124

*/

struct S {
    public let v: Int64
    public init(a: Int64) { this.v = a }
    public prop p: Int64 {
        get() { 2 }
    }
    public func f() { 3 }
    public func t<T>() { 4 }
    public operator func -(right: Int64) { right }

    func test() {
        v
        p
        f()
        t<Nothing>()
        this - 5
    }
}

main() {
    S(1).v
    S(1).p
    S(1).f()
    S(1).t<Nothing>()
    S(1) - 5
}
