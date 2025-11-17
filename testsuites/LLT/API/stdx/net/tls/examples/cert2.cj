/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: ../files
// EXEC: %compiler %import-cangjie-stdx  %cmp_opt -o %n.%suffix %f
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_args

import std.{fs.*, net.*, collection.*, io.*}
import stdx.net.tls.*
import stdx.crypto.x509.*
import stdx.crypto.keys.*

let certificatePath = "./files/apiserverchain.crt"

func parsePem(text: String): (Array<X509Certificate>, PrivateKey) {
    let pem = Pem.decode(text)
    let chain = pem |> filter<PemEntry> {entry => entry.label == PemEntry.LABEL_CERTIFICATE} |>
        map<PemEntry, X509Certificate> {entry => X509Certificate.decodeFromDer(entry.body ?? DerBlob())} |> collectArray

    let key = (pem |> filter<PemEntry> {entry => entry.label == PemEntry.LABEL_PRIVATE_KEY} |>
        map<PemEntry, PrivateKey> {entry => PrivateKey.decodeDer(entry.body ?? DerBlob())} |> first) ??
            throw Exception("No private key found in the PEM file")

    if (chain.isEmpty()) {
        throw Exception("No certificates found in the PEM file")
    }

    return (chain, key)
}

func readTextFromFile(path: String): String {
    var fileString = ""
    try (file = File(path, Read)) {
        fileString = String.fromUtf8(readToEnd(file))
        ()
    }
    fileString
}

main() {
    // 对证书及私钥进行解析
    let pem = readTextFromFile(certificatePath)

    let (certificate, privateKey) = parsePem(pem)

    var _ = TlsServerConfig(certificate, privateKey)

    // 进行https服务，请参阅其他服务器示例
}
