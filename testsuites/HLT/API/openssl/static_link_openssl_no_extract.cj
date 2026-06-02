/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// Linux native.
// (host_linux & target_linux) EXEC: %compiler %f --import-path %cangjie-static-stdx-path -L %cangjie-static-stdx-path --link-option --start-group -lstdx.chir -lstdx.unittest.data -lstdx.unittest -lstdx.encoding.json -lstdx.serialization.serialization -lstdx.serialization -lstdx.net.http -lstdx.net.tls -lstdx.net.tls.common -lstdx.net -lstdx.logger -lstdx.log -lstdx.encoding.url -lstdx.encoding.json.stream -lstdx.crypto.kit -lstdx.crypto.x509 -lstdx.crypto.crypto -lstdx.crypto.keys -lstdx.crypto.digest -lstdx.crypto.common -lstdx.encoding.hex -lstdx.encoding.base64 -lstdx.encoding -lstdx.compress.tar -lstdx.crypto -lstdx.compress.zlib -lstdx.compress -lstdx.actors -lstdx --link-option --end-group -L %openssl_path -lpthread -ldl --link-option "-Bstatic" "%openssl_path/libssl.a" "%openssl_path/libcrypto.a" --link-option "-Bdynamic" -o %output

// (target_android) EXEC: %compiler %ohos_opt %f --import-path %cangjie-static-stdx-path -L %cangjie-static-stdx-path --link-option --start-group -lstdx.chir -lstdx.unittest.data -lstdx.unittest -lstdx.encoding.json -lstdx.serialization.serialization -lstdx.serialization -lstdx.net.http -lstdx.net.tls -lstdx.net.tls.common -lstdx.net -lstdx.logger -lstdx.log -lstdx.encoding.url -lstdx.encoding.json.stream -lstdx.crypto.kit -lstdx.crypto.x509 -lstdx.crypto.crypto -lstdx.crypto.keys -lstdx.crypto.digest -lstdx.crypto.common -lstdx.encoding.hex -lstdx.encoding.base64 -lstdx.encoding -lstdx.compress.tar -lstdx.crypto -lstdx.compress.zlib -lstdx.compress -lstdx.actors -lstdx --link-option --end-group --link-option "-Bstatic" "%openssl_path/libssl.a" "%openssl_path/libcrypto.a" --link-option "-Bdynamic" -o %output

// MacOS native.
// (host_mac & target_mac) EXEC: %compiler %f --import-path %cangjie-static-stdx-path -L %cangjie-static-stdx-path -lstdx.unittest.data -lstdx.unittest -lstdx.encoding.json -lstdx.serialization.serialization -lstdx.serialization -lstdx.net.http -lstdx.net.tls -lstdx.net.tls.common -lstdx.net -lstdx.logger -lstdx.log -lstdx.encoding.url -lstdx.encoding.json.stream -lstdx.crypto.kit -lstdx.crypto.x509 -lstdx.crypto.crypto -lstdx.crypto.keys -lstdx.crypto.digest -lstdx.crypto.common -lstdx.encoding.hex -lstdx.encoding.base64 -lstdx.encoding -lstdx.compress.tar -lstdx.crypto -lstdx.compress.zlib -lstdx.compress -lstdx.actors -lstdx -lpthread -ldl --link-option "%openssl_path/libssl.a" --link-option "%openssl_path/libcrypto.a" -o %output

// Windows native.
// (host_win & target_win) EXEC: %compiler %f -L %cangjie-static-stdx-path --link-option --start-group -l stdx.crypto.keys -l stdx.crypto.common -l stdx.encoding.base64 -l stdx.crypto.digest -l stdx.encoding.hex --link-option --end-group --import-path %cangjie-static-stdx-path "%openssl_path"/libssl.a "%openssl_path"/libcrypto.a --link-option -lws2_32 --link-option -lcrypt32 -Woff all -o %output

// RUN-EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan verfication successful

// EXEC: %check-dylib-dep %output

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
