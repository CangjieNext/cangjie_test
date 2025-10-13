package diagnosticsTest.other_error

class SomeType0 {
    ~init() {} // OK
}
class SomeType1 {
    ~init(x: Int64) {} // Error, finalizer cannot have parameters
}
class SomeType2 {
    private ~init() {} // Error, finalizer cannot have accessibility modifiers
}
class SomeType3 {
    open ~init() {} // Error, finalizer cannot have open modifier
}
open class SomeType4 {
    ~init() {} // Error, open class can't have a finalizer
}

var GlobalVar: SomeType5 = SomeType5()
class SomeType5 {
    ~init() {
        GlobalVar = this // do not escape `this` out of finalizer, otherwise, unexpected behavior may happen.
    }
}

/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
