// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %diag_json %f %compile_lib_opt 2>&1 | compare %f
package mynet 

sealed abstract class IPPrefix {
    public operator func ==(rhs: IPPrefix): Bool {
        match ((this, rhs)) {
            case (lv4: IPv4Prefix, rv4: IPv4Prefix) => lv4 == rv4
            case (lv6: IPv6Prefix, rv6: IPv6Prefix) => lv6 == rv6
            case _ => false
        }
    }
}

class IPv4Prefix <: IPPrefix {
    let _ip: UInt32

    init(ip: UInt32) {
        _ip = ip
    }
    public operator func ==(rhs: IPv4Prefix): Bool {
        return this._ip == rhs._ip
    }
}

class IPv6Prefix <: IPPrefix {
    let _ip: UInt32

    init(ip: UInt32) {
        _ip = ip
    }
    public operator func ==(_: IPv6Prefix): Bool {
        true
    }
}

// ASSERT: scan-not Warnings