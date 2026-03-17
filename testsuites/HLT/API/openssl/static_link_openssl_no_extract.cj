/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// (host_linux & target_linux) EXEC-PIPE: %shell scripts/build_linux.sh | compare %f
// (host_mac & target_mac) EXEC-PIPE: %shell scripts/build_linux.sh | compare %f
// (host_mac & target_ohos) EXEC-PIPE: %shell scripts/build_linux.sh | compare %f
// (host_mac & target_android) EXEC-PIPE: %shell scripts/build_android.sh | compare %f
// (host_mac & (target_ios | target_ios_simulator)) EXEC-PIPE: %shell scripts/build_ios.sh | compare %f
// (host_win & target_win) EXEC: cjc main.cj -L %cangjie-static-stdx-path --link-option --start-group -l stdx.crypto.keys -l stdx.crypto.common -l stdx.encoding.base64 -l stdx.crypto.digest -l stdx.encoding.hex --link-option --end-group --import-path %cangjie-static-stdx-path -L "C:\msys64\usr\local\openssl\lib64" -lssl -lcrypto --link-option -lws2_32 --link-option -lcrypt32 -Woff all -o %output
// (host_win & target_win) EXEC: dumpbin /dependents %output
// EXEC: %run %run_opt %output %run_args
// ASSERT: scan verfication successful

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
