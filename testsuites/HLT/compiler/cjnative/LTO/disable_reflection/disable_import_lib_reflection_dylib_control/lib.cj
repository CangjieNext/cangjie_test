// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package lib

import pkgs
import pkga
import pkgb

// dylib 对外门面：转调三个导入库的符号，exe 只依赖本库导出
public struct Wrapped {
    public var inner: pkgs.Data<Int32>
    public init(w: Int32, h: Int32) {
        this.inner = pkgs.makeData(w, h)
    }
    public func area(): Int32 {
        return inner.area()
    }
    public func summary(): String {
        return inner.summary()
    }
    public func isOrigin(): Bool {
        return inner.isOrigin()
    }
}

public func makeWrapped(w: Int32, h: Int32): Wrapped {
    return Wrapped(w, h)
}

public func bump(): Int64 {
    return pkgs.bump()
}

public func boxVolume(): Int64 {
    let bx: pkgb.Box3<Int64> = pkgb.Box3<Int64>(1, 2, 3, 0)
    return bx.volume()
}

public func modeValue(m: pkgb.Mode): Int64 {
    return pkgb.modeValue(m)
}


public func usePkga(): Int64 {
    let d: pkga.Data<Int32> = pkga.makeData(4, 3)
    if (d.area() != 4) {
        return 1
    }
    return 0
}
