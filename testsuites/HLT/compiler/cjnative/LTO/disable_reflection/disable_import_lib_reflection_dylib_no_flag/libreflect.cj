// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package libreflect

import pkgs
import pkga
import pkgb
import std.reflect.*

// std.reflect 豁免版门面库：import std.reflect 并使用 TypeInfo.of
// dylib 构建时即使带 --disable-reflection，LinksStdReflect 命中也不透传裁剪开关
public struct Wrapped {
    public var inner: pkgs.Data<Int32>
    public init(w: Int32, h: Int32) {
        this.inner = pkgs.makeData(w, h)
    }
    public func area(): Int32 {
        return inner.area()
    }
}

public func makeWrapped(w: Int32, h: Int32): Wrapped {
    return Wrapped(w, h)
}

public func reflectName(): String {
    return TypeInfo.of<Wrapped>().toString()
}

public func reflectData(): String {
    return TypeInfo.of<pkgs.Data<Int32>>().toString()
}

public func reflectInt(): String {
    return TypeInfo.of<Int64>().toString()
}

public func reflectAll(): Bool {
    return !reflectName().isEmpty()
        && !reflectData().isEmpty()
        && !reflectInt().isEmpty()
}

public func boxVolume(): Int64 {
    let bx: pkgb.Box3<Int64> = pkgb.Box3<Int64>(1, 2, 3, 0)
    return bx.volume()
}

public func usePkga(): Int64 {
    let d: pkga.Data<Int32> = pkga.makeData(4, 3)
    if (d.area() != 4) {
        return 1
    }
    return 0
}
