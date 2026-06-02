/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
package otherPackageToImport

public abstract class FooAbstractFinalMethod {
    public func foo(x: PassedBar, y: PassedAnotherBar): ReturnedBar
    public open func foo_impl_3(x: PassedBar, y: PassedAnotherBar): ReturnedBar {
        ReturnedBar("0")
    }
    public func foo_impl_2(x: PassedBar, y: PassedAnotherBar): ReturnedBar {
        ReturnedBar("0")
    }
}

public open class FooOpenFinalMethod {
    public open func foo(x: PassedBar, y: PassedAnotherBar): ReturnedBar {
        ReturnedBar("0")
    }
    public func foo_impl_3(x: PassedBar, y: PassedAnotherBar): ReturnedBar {
        ReturnedBar("0")
    }
}

public open class DerivedFooOpenFinalMethod <: FooOpenFinalMethod {
    public open func foo(x: PassedBar, y: PassedAnotherBar): ReturnedBar {
        ReturnedBar("0")
    }
}

public open class DerivedFooAbstractFinalMethod <: FooAbstractFinalMethod {
    public open func foo(x: PassedBar, y: PassedAnotherBar): ReturnedBar {
        ReturnedBar("0")
    }
}
