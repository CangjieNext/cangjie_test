/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.fs.File
import stdx.encoding.json.*

main(args: Array<String>): Int64 {
    if (String.fromUtf8(File.readFrom(args[0i64])).isEmpty()) {
        0i64
    } else {
        1i64
    }
}
