// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// Negative: shared field Invoke on ICipher must not rewrite to Other/Good under multi
// CipherBase<T> subclasses (Good ok, Other throws in write; Bad inherits CipherBase.write).
// Runtime: main uses Good; wrong Apply to Bad/Other would abort.
// DEPENDENCE: ../pick_defination.py
// EXEC: %compiler %cmp_opt %enableO2 %dumpCHIRDebug -Woff all --no-sub-pkg %n.cj
// EXEC: %python pick_defination.py default_CHIR/[0-9]*_Devirtualization.chirtxt "Func @_CN7default10Compressed5writeHRNat5ArrayIhE" | compare %f
// RUN-EXEC-PIPE-0: %run main
// ASSERT: scan Invoke(Class-_CN7default7ICipherE&->@_CNah12OutputStream5writeHRNat5ArrayIhE
// ASSERT: scan-not Apply(Class-_CN7default5OtherE&->@_CN7default5Other5writeHRNat5ArrayIhE
// ASSERT: scan-not Apply(Class-_CN7default4GoodE&->@_CN7default4Good5writeHRNat5ArrayIhE

import std.io.OutputStream
import std.core.Resource

interface Enc {
    func tag(): Int64
}

class EncA <: Enc {
    public func tag(): Int64 {
        10
    }
}

class EncB <: Enc {
    public func tag(): Int64 {
        20
    }
}

class EncC <: Enc {
    public func tag(): Int64 {
        30
    }
}

abstract class ICipher <: OutputStream & Resource {
    public func write(b: Array<UInt8>): Unit
    public func close(): Unit
    public func isClosed(): Bool
    public func id(): Int64
}

abstract class CipherBase<T> <: ICipher where T <: Enc {
    protected var enc: T = unsafe { zeroValue<T>() }

    public open func write(b: Array<UInt8>): Unit {
        println("BASE.write")
        let _ = (b, enc.tag())
    }

    public func close(): Unit {}

    public func isClosed(): Bool {
        false
    }

    public func flush(): Unit {}

    public func id(): Int64 {
        enc.tag()
    }
}

class Good <: CipherBase<EncA> {
    public init() {
        this.enc = EncA()
    }

    public override func write(b: Array<UInt8>): Unit {
        println("GOOD.write")
        super.write(b)
    }
}

class Bad <: CipherBase<EncB> {
    public init() {
        this.enc = EncB()
    }
}

class Other <: CipherBase<EncC> {
    public init() {
        this.enc = EncC()
    }

    public override func write(b: Array<UInt8>): Unit {
        throw Exception("OTHER.write")
        super.write(b)
    }
}

open class Compressed <: OutputStream & Resource {
    private var cipher: ICipher

    public init(cipher: ICipher) {
        this.cipher = cipher
    }

    public open func write(b: Array<UInt8>): Unit {
        println("COMP.write")
        cipher.write(b)
    }

    public func flush(): Unit {}

    public func close(): Unit {
        cipher.close()
    }

    public func isClosed(): Bool {
        cipher.isClosed()
    }

    public func id(): Int64 {
        cipher.id()
    }
}

func makeCipher(kind: Int64): ICipher {
    if (kind == 0) {
        return Bad()
    } else if (kind == 1) {
        return Other()
    }
    return Good()
}

main(): Int64 {
    let buf = Array<UInt8>(4, repeat: 0)
    let h = Compressed(makeCipher(2))
    h.write(buf)
    h.id() - 10
}
