/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         02_02_01_a07_03

  @Level:         1
  @Assertion:    2.2.1(7) Only when the concrete type Type in Array<T> supports
                 using ==(! =) for equality (inequality) comparison, Array<T>
                 supports == and ! =, otherwise, Array<T> does not support ==
                 and ! = (a compilation error will be generated when using ==
                 and ! = for comparison).
                 We say two instances of Array<T> (with the same type) are
                 equal, if and only if elements in the same position (i.e.,
                 index) are all equal, which means they have the same length.

  @Description:  Checks that equality works as expected for Arrays of types
                 supporting == and != operations

  @Mode:         run
  @Negative:     no
  @Structure:    single

  @Issue:        0006500

*/

class A <:Equatable<A> {
    public var val: Int64

    public init(val: Int64) {
        this.val = val
    }

    public operator func ==(that: A): Bool {
        this.val == that.val
    }

    public operator func !=(that: A): Bool {
        this.val != that.val
    }
}

main(): Int64 {
    let a5: Array<A> = [A(1), A(2), A(3), A(4), A(5)]
    let a6: Array<A> = [A(1), A(2), A(3), A(4), A(5)]
    let b = a5 == a6

    return 0
}
