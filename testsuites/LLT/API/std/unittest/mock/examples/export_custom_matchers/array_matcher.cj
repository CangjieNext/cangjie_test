/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
package export_custom_matchers

import std.unittest.mock.*

public interface ArrayMatchers {
    static func arrayContains<T>(target: T): TypedMatcher<Array<T>> where T <: Equatable<T>
}

extend Matchers <: ArrayMatchers {
    public static func arrayContains<T>(target: T): TypedMatcher<Array<T>> where T <: Equatable<T> {
        return Matchers.argThat<Array<T>> {
            arr: Array<T> =>
            for (el in arr) {
                if (el == target) {
                    return true
                }
            }
            return false
        }
    }
}
