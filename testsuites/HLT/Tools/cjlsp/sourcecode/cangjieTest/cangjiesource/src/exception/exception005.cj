/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.exception

class A8 <: Exception {}

interface B8 {
    func foo() {
        try {
            throw A8()
        } catch (_) {} finally {}
    }
}
