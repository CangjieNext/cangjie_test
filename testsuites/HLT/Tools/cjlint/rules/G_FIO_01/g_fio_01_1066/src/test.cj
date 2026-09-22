/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.fs.*

main() {
    let pathName = "tempdoc.txt"
    let fs: File = File(pathName, Append)
    fs.flush()
    fs.close()
}
