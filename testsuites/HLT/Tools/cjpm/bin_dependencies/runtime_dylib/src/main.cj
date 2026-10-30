/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package runtime_dylib

import stdx.compress.zlib.*
import std.io.*

main(): Int64 {
    let input = ByteBuffer("runtime dependency".toArray())
    let stream = BufferedInputStream(input)
    let compressor = CompressInputStream(stream)
    compressor.close()
    println("runtime dependency loaded")
    return 0
}
