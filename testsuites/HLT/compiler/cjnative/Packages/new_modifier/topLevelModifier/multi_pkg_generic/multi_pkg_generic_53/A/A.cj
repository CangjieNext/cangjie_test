/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package A

public import B.*

private class AA<T> {}

extend<T> AA<T> where T <: BB<Int64> {
    public func test() {
        return 1
    }
}
