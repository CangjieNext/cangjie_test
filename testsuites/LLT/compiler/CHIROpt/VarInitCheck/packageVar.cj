// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %disableSemaVic  %compile_lib_opt %cmp_opt -Woff unused %n.cj

package pkg

public open class CMsgFidTrans_Ty {}

public var CMsgFidTrans: CMsgFidTrans_Ty = CMsgFidTrans_Ty()

public func Initialize_l2pub() {
    var a = CMsgFidTrans
}

main() {
    0
}
