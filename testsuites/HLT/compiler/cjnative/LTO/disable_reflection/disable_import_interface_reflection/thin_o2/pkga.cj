// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package pkga

// 接口 + 实现类：与 pkgs 同构，跨包覆盖
public interface Shape2D {
    func area(): Int64
    func scale(factor: Int64): Shape2D
}

public open class BaseShape {
    public var id: Int64
    public init(id: Int64) {
        this.id = id
    }
    public func identify(): String {
        return "base-${id}"
    }
}

public class Rect <: BaseShape & Shape2D {
    public var width: Int64
    public var height: Int64
    public var owner: String
    public init(width: Int64, height: Int64) {
        super(9)
        this.width = width
        this.height = height
        this.owner = "pkga"
    }
    public func area(): Int64 {
        return width * height
    }
    public func scale(factor: Int64): Shape2D {
        return Rect(width * factor, height * factor)
    }
    public func ownerTag(): String {
        return "${owner}-${id}"
    }
}

public let defaultOwner: String = "pkga-default"

public func makeRect(w: Int64, h: Int64): Rect {
    return Rect(w, h)
}
