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
