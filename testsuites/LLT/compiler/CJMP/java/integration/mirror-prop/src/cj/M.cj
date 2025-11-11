// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package cj

import interoplib.interop.*
import java.lang.JObject

@JavaMirror["com.java.lib.M"]
public open class M {
    public prop x: Int64
    public mut prop xm: Int64
    public static prop xs: Int64
    public static mut prop xms: Int64

    public prop m: M
    public mut prop mm: M
    public static prop ms: M
    public static mut prop mms: M

    public init(i: Int64)
}
