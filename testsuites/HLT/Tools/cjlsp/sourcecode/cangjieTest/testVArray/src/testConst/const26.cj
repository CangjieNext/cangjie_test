/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.testConst

interface I3 {
    const func fas(): Unit
}

class C7 {
    const init() {}
}

extend C7 <: I3 {
    public const func fas(): Unit {}
}

func h26() {
    var u1 = C7().fas()
}
