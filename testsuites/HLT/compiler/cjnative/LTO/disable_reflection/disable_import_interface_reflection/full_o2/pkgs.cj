// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package pkgs

// 接口 + 实现类：验证接口虚分派在 --disable-reflection 裁剪后仍可用
// 保留符号锚点 pkgs:Rect.ti.fieldnames / reflect.dbg / method0（非泛型类型使用 .ti.）
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
        super(7)
        this.width = width
        this.height = height
        this.owner = "pkgs"
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

public let defaultOwner: String = "pkgs-default"

public func makeRect(w: Int64, h: Int64): Rect {
    return Rect(w, h)
}
