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
    var sha512Instance = SHA512()
    var sh: Array<Byte> = digest(sha512Instance, str)
    var result: String = toHexString(sh)
    if (result !=
        "2d87c14f4a4eb44636826b1f2847d99d402388ba74104a19efaabf3acf7042dbd009b3cae1a4a6270aabc539f3bb5490e7e6511d0d5bdc774a83086d1677720d") {
        return 1
    }
    return 0
}
