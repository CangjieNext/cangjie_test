/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
package bodyReadUtil

import std.collection.*
import stdx.net.http.*

public func readAll(size: Int64, response: HttpResponse): String {
    let buf = Array<UInt8>(size, repeat: 0)
    let buffer = ArrayList<UInt8>()
    var i = 0
    do {
        i = response.body.read(buf)
        buffer.add(all: buf[..i])
    } while (i != 0)
    return String.fromUtf8(buffer.toArray())
}
