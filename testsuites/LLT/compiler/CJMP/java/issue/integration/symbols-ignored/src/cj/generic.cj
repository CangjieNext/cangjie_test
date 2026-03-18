/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package generic

import interoplib.interop.*

// Test case for issue: Constructor is mirrored even when not listed in symbols

public struct G<T> {
    public func f(t: T): T { t }
}

public struct H<T> {
    public func g(t: T): T { t }
}
