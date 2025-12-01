/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

 package cjworld
import objc.lang.*
@ObjCImpl
public class A <:M {
public init() {
}
public open func foo(): Unit  {
var p = M()
println("in cangjie foo")
}

}
@C
public struct S  {
public var x: Int32 = 0i32

public var y: Int32 = 0i32

}
@ObjCMirror
public open class M {
public init() 
public open func goo(): S  

}
