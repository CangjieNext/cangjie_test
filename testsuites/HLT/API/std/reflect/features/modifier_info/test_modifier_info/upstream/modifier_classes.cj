/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

 package upstream
public class PlainModifierClass {
public let plainVar: Int64 = 0i64

public func plainFunc(): Int64  {
1i64
}

public  prop plainProp: Int64 {
get() {
2i64
}

}

}
public class ExplicitModifierClass {
public open func openFunc(): Int64  {
3i64
}

public static func staticFunc(): Int64  {
4i64
}

public static let staticVar: Int64 = 5i64

public var mutVar: Int64 = 6i64

}
public abstract class ImplicitSemanticClass {
public func abstractFunc(): Int64  

public func concreteFunc(): Int64  {
9i64
}

}
public interface ModifierInterface {
func ifaceFunc(): Int64  

  prop ifaceProp: Int64

}
public class UnstableModifiersClass {
static public  prop sp: Int64 {
get() {
7i64
}

}

public static let sv: Int64 = 8i64

}
