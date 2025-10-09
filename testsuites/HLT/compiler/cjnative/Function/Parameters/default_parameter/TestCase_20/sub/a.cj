/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package root.sub

public class C {
    public C(internal var p0!: String = "xxx${g()}" |> h) {
    }
}

public func g(): String {
    "hello"
}

public func h(p: String): String {
    "hello"
}
