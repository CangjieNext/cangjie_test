/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// Linux native.
// (host_linux & target_linux) EXEC: %compiler %f --import-path %cangjie-dynamic-stdx-path -L %cangjie-dynamic-stdx-path -lstdx.crypto.keys -lstdx.crypto.digest -o %output
// (host_linux & target_linux) EXEC: ldd %output

// MacOS native.
// (host_mac & target_mac) EXEC: %compiler %f --import-path %cangjie-dynamic-stdx-path -L %cangjie-dynamic-stdx-path -lstdx.crypto.keys -lstdx.crypto.digest -o %output
// (host_mac & target_mac) EXEC: otool -L %output

// Windows native.
// (host_win & target_win) EXEC: %compiler %cmp_opt %f --import-path %cangjie-dynamic-stdx-path -L %cangjie-dynamic-stdx-path -lstdx.crypto.keys -lstdx.crypto.digest -o %output
// (host_win & target_win) EXEC: dumpbin /dependents %output

// (host_mac & target_mac) RUN-EXEC-PIPE-134: %run_stdx %run_opt %output %run_args 2>&1 | compare %f
// (!(host_mac & target_mac)) RUN-EXEC-PIPE: %run_stdx %run_opt %output %run_args 2>&1 | compare %f

// MacOS native禁止这样动态链接openssl
// (host_mac & target_mac) ASSERT: scan loading libcrypto in an unsafe way

// 其他场景则允许
// (!(host_mac & target_mac)) ASSERT: scan verfication successful

package my_pkg

import stdx.crypto.keys.*
import stdx.crypto.digest.*
import std.convert.*
import std.crypto.digest.*

main(): Unit {
    let ecPri = ECDSAPrivateKey(P224)
    let ecPub = ECDSAPublicKey(ecPri)
    let str = "helloworld"
    let sha512Instance = SHA512()
    sha512Instance.write(str.toArray())
    let md = sha512Instance.finish()
    let sig = ecPri.sign(md)
    if (ecPub.verify(md, sig)) {
        println("verfication successful")
    }
}
