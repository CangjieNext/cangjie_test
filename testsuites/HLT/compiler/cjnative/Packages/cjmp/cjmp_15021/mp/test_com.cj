/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package mp
public class A<T> {}
public interface I1 {}
public interface I2<T> {}
public interface I3<T, K> {}
public class B <: I1 & I2<I1> & I3<I1, I2<I1>> {}
common extend <T> A<T> where T <: I1 & I2<I1> & I3<I1, I2<I1>> {
    public common func foo1() { 1 }
    public common static func foo2() { 1 }
}
public func f1() {
    return A<B>().foo1() + A<B>.foo2()
}
