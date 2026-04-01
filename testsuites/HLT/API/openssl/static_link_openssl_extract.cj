/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// Linux native.
// (host_linux & target_linux) EXEC: %compiler %f --import-path %cangjie-static-stdx-path -L %cangjie-static-stdx-path --link-option --start-group -lstdx.chir -lstdx.unittest.data -lstdx.unittest -lstdx.encoding.json -lstdx.serialization.serialization -lstdx.serialization -lstdx.net.http -lstdx.net.tls -lstdx.net.tls.common -lstdx.net -lstdx.logger -lstdx.log -lstdx.encoding.url -lstdx.encoding.json.stream -lstdx.crypto.kit -lstdx.crypto.x509 -lstdx.crypto.crypto -lstdx.crypto.keys -lstdx.crypto.digest -lstdx.crypto.common -lstdx.encoding.hex -lstdx.encoding.base64 -lstdx.encoding -lstdx.compress.tar -lstdx.crypto -lstdx.compress.zlib -lstdx.compress -lstdx.actors -lstdx --link-option --end-group -L/usr/local/lib64 -lpthread -ldl --link-option "-Bstatic" --link-option --whole-archive -lssl -lcrypto --link-option --no-whole-archive --link-option "-Bdynamic" -o %output

// MacOS native.
// (host_mac & target_mac) EXEC: %compiler %f --import-path %cangjie-static-stdx-path -L %cangjie-static-stdx-path -lstdx.unittest.data -lstdx.unittest -lstdx.encoding.json -lstdx.serialization.serialization -lstdx.serialization -lstdx.net.http -lstdx.net.tls -lstdx.net.tls.common -lstdx.net -lstdx.logger -lstdx.log -lstdx.encoding.url -lstdx.encoding.json.stream -lstdx.crypto.kit -lstdx.crypto.x509 -lstdx.crypto.crypto -lstdx.crypto.keys -lstdx.crypto.digest -lstdx.crypto.common -lstdx.encoding.hex -lstdx.encoding.base64 -lstdx.encoding -lstdx.compress.tar -lstdx.crypto -lstdx.compress.zlib -lstdx.compress -lstdx.actors -lstdx -L/usr/local/lib64 -lpthread -ldl --link-option "-force_load" --link-option "%openssl_path/libssl.a" --link-option "-force_load" --link-option "%openssl_path/libcrypto.a" -o %output

// iOS cross-compilation.
// (host_mac & (target_ios | target_ios_simulator)) EXEC: %compiler %cmp_opt %f --import-path $CANGJIE_LOCAL_STDX_PATH --import-path %cangjie-static-stdx-path -L %cangjie-static-stdx-path -lstdx.unittest.data -lstdx.unittest -lstdx.encoding.json -lstdx.serialization.serialization -lstdx.serialization -lstdx.net.http -lstdx.net.tls -lstdx.net.tls.common -lstdx.net -lstdx.logger -lstdx.log -lstdx.encoding.url -lstdx.encoding.json.stream -lstdx.crypto.kit -lstdx.crypto.x509 -lstdx.crypto.crypto -lstdx.crypto.keys -lstdx.crypto.digest -lstdx.crypto.common -lstdx.encoding.hex -lstdx.encoding.base64 -lstdx.encoding -lstdx.compress.tar -lstdx.crypto -lstdx.compress.zlib -lstdx.compress -lstdx.actors -lstdx -L/usr/local/lib64 -lpthread -ldl --link-option "-force_load" --link-option "%openssl_path/libssl.a" --link-option "-force_load" --link-option "%openssl_path/libcrypto.a" --output-type=staticlib -o %output

// Windows native.
// (host_win & target_win) EXEC: %compiler %f -L %cangjie-static-stdx-path --link-option --start-group -l stdx.crypto.keys -l stdx.crypto.common -l stdx.encoding.base64 -l stdx.crypto.digest -l stdx.encoding.hex --link-option --end-group --import-path %cangjie-static-stdx-path --link-option --whole-archive "%openssl_path"/libssl.a "%openssl_path"/libcrypto.a --link-option --no-whole-archive --link-option -lws2_32 --link-option -lcrypt32 -Woff all -o %output

// RUN-EXEC: %run %run_opt %output %run_args
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
