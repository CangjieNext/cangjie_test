// DEPENDENCE: %n.expect
// EXEC: %compiler %cmp_opt_chir2hlir %coverage_opt %f -o %output
// EXEC: %run %run_opt %output > %n.txt
// EXEC: %diff %n.expect %n.txt

internal import std.ast.*
internal import std.collection.*

class MyVisitor <: Visitor {
    var ident: ArrayList<String> = ArrayList<String>()
    public override func visit(curNode: TryExpr) {
        ident.add("node")
        breakTraverse()
    }
}

let myVisitor = MyVisitor()

main(): Int64 {
    let input = quote(
        try (certFile = File(certFilePath, Read)) {
            var privateKey = Option<PrivateKey>.None
            try (keyFile = File(keyFilePath, Read)) {
                let keyStr = String.fromUtf8(readToEnd(keyFile))
                privateKey = PrivateKey.decodeFromPem(keyStr)
            } catch (e: FSException | TlsException) {
                LOGGER.error("read pem file private_key.pem failed: ${e}")
                return config
            }

            let certStr = String.fromUtf8(readToEnd(certFile))
            let certs = x509.X509Certificate.decodeFromPem(certStr)
            if (let Some(v) <- privateKey) {
                var tlsConfig = TlsServerConfig(certs, v)
                if (supportHttp2) {
                    tlsConfig.supportedAlpnProtocols = ["h2"]
                }
                config = Some(tlsConfig)
            }
        } catch (e: FSException | TlsException) {
            LOGGER.error("read cert file cert.pem failed: ${e}")
        } catch (e: Exception) {
            LOGGER.error("")
        }
    )
    let expr = match (parseExpr(input) as TryExpr) {
        case Some(v) => v
        case None => throw Exception()
    }
    let flag = compareTokens(input, expr.toTokens())
    if (!flag) {
        return 1
    }
    if (expr.resourceSpec.size != 1) {
        return 2
    }
    if (expr.catchPatterns.size != 2) {
        return 3
    }
    expr.traverse(myVisitor)
    if (myVisitor.ident.size != 1) {
        return 4
    }
    expr.dump()
    return 0
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
