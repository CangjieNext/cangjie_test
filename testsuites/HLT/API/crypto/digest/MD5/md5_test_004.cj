/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %link_openssl -o  %output %f
// RUN-EXEC: %run_stdx %output %run_args  

import stdx.crypto.digest.*
import std.convert.*
import std.crypto.digest.*
import stdx.encoding.hex.*

main() {
    var str: String = """
$$Weclome###MD5__toCangjie%%%$$$$Weclome###MD5__toCangjie%%%$$
$$Weclome###MD5__toCangjie%%%$$$$Weclome###MD5__toCangjie%%%$$
        """
    var md5Instance = MD5()
    var md: Array<Byte> = digest(md5Instance, str)
    var result: String = toHexString(md)

    if (result != "dc6724831b1248887a5b481f41058c8b") {
        return 1
    }
    return 0
}
