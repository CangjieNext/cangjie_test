/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package mp

protected platform interface NamedType {
    func f1(): Int64 {1}
    static platform func f2(): String {"abc"}
    static platform func typename(): String {
        f()
    }
    static platform func f(): String {"aaa"}
}
