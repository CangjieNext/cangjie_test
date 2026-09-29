/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

 package upstream
public interface PlainInterface {
}
public interface RichInterface {
func area(): Int64  

func describe(prefix: String): String  

}
public sealed interface SealedInterface {
func name(): String  

}
public class Circle <:SealedInterface {
public var radius: Int64 = 5i64

public init() {
}
public func name(): String  {
return "Circle"
}

}
public class Square <:SealedInterface {
public var side: Int64 = 4i64

public init() {
}
public func name(): String  {
return "Square"
}

}
