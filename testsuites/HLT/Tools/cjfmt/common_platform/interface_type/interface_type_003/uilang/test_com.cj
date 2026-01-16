/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package mp

protected common interface NamedType {
    func f1(): Int64
    static common func f2(): String
    static common func typename(): String {
        f()
    }
    static common func f(): String
}
