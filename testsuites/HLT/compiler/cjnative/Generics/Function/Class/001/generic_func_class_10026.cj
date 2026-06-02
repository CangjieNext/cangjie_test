/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan sema_upper_bound_must_be_class_or_interface

class C1 {}

class C2 {}

class C<A> {
    public func f1<B>(x: A): A where B <: A {
        func f2<C>(x: B): B where C <: B {
            return x
        }
        func f1<B>(x: A): A where B <: A {
            func f2<C>(x: B): B where C <: B {
                return x
            }
            func f1<B>(x: A): A where B <: A {
                func f2<C>(x: B): B where C <: B {
                    return x
                }
                func f1<B>(x: A): A where B <: A {
                    func f2<C>(x: B): B where C <: B {
                        return x
                    }
                    func f1<B>(x: A): A where B <: A {
                        func f2<C>(x: B): B where C <: B {
                            return x
                        }
                        func f1<B>(x: A): A where B <: A {
                            func f2<C>(x: B): B where C <: B {
                                return x
                            }
                            func f1<B>(x: A): A where B <: A {
                                func f2<C>(x: B): B where C <: B {
                                    return x
                                }
                                return x
                            }
                            return x
                        }
                        return x
                    }
                    return x
                }
                return x
            }
            return x
        }
        return x
    }
}

main() {
    0
}
