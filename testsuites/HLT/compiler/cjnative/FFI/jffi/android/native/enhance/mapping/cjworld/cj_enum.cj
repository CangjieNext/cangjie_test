/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package UNNAMED

import interoplib.interop.*
import java.lang.*

public enum CangjieEnum<T0> {
    | A(T0)

    public func instanceMemberFunction(p0: T0): T0 {
        p0
    }

    public prop instancecMemberProperty: T0 {
        get() {
            match (this) {
                case A(v) => v
            }
        }
    }
}
