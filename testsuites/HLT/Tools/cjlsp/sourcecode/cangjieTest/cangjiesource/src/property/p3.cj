/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.property

struct R3 {
    prop i: Int64 {
        get() {
            return 0
        }
    }
}


class C3 {
    prop i: Int64 {
        get() {
            return 0
        }
    }
}

extend C3 {
    prop s: String {
        get() {
            return "aaa"
        }
    }
}

interface I {
    prop a: Int64
}
