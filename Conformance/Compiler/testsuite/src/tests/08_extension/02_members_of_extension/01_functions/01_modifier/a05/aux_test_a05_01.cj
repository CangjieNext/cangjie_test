/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
   @Structure:       complex-aux

*/

package p1
public open class Foo {}
extend Foo {
    private func f1() {} // ok
    public func f2() {} // ok
    protected func f3() {} // ok
    func f4() {} // visible in the package
}
