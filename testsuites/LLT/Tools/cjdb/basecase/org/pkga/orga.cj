// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package org::pkga
public let x = 1
public func testa() {
    return x
}

public class AA {
    var aa = 1
    let ab = 2
}

public let xx = AA()

public struct BB {
    let ba = 3
    var bb = 4
}

public var xxx = BB()

public var aa: Int8 = 1
public var bb: Int16 = 2
public var cc: Int32 = 3
public var dd: Int64 = 4
public var ee: IntNative = 5
public var ff: Array<IntNative> = [ee, ee]
public var gg: Option<IntNative> = Some(ee)
public var hh: Option<IntNative> = None

public enum EE1 {
    EA | EB
}

public enum EE2 {
    EA
}

public enum EE3 {
    EA | EB(Int64)
}

public enum EE4 {
    EA | EB(AA)
}

public enum EE5 {
    EA | EB(Int64) | EC
}

public let aaa = EE1.EB
public let bbb = EE2.EA
public let ccc = EE3.EB(50)
public let ddd = EE4.EB(AA())
public let eee = EE5.EB(50)
