/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            08_03_a05_01

  @Level:         1

  @Assertion:       8.3(5) 
                    class Foo<T> {
                        var item: T
                        init(it: T) {
                            item = it
                        }
                    }

                    interface Eq<T> {
                        func equals(other: T): Bool
                    }

                    extend Foo<T> where T <: Eq<T> {
                        public func equals(other: Foo<T>) {
                            item.equals(other.item)
                        }
                    }

                    class A {}
                    class B <: Eq<B> {
                        public func equals(other: B) { true }
                    }

                    main() {
                        let a = Foo(A())
                        a.equals(a) // error, A has not implement Eq
                        let b = Foo(B())
                        b.equals(b) // ok, B has implement Eq
                    }

  @Description:     Positive example from spec.

  @Mode:            compileonly

  @Negative:        no

  @Structure:       single

*/

class Foo<T> {
    var item: T
    init(it: T) {
        item = it
    }
}

interface Eq<T> {
    func equals(other: T): Bool
}

extend<T> Foo<T> where T <: Eq<T> {
    public func equals(other: Foo<T>) {
        item.equals(other.item)
    }
}

class B <: Eq<B> {
    public func equals(other: B) { true }
}

main() {
    let b = Foo(B())
    b.equals(b) // ok, B has implement Eq
    0
}
