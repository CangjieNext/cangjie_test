/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package cjworld

import objc.lang.*

@ObjC
public open foreign class NSObject {
    init()
}

@ObjC
public foreign class NSString <: NSObject {
    init()
}

@ObjC
public foreign func foo(obj: NSString, f: Float64): NSString

@ObjC
public foreign func className(obj: NSObject): NSString

@ObjC
public foreign func bar(i: Int64): Int64

foreign func bar2(i: Int64): Int64

@ObjC
public foreign func NSLog(str: NSString): Unit

@C
public func cangjieMain(): Int32 {
    foo(className(NSObject()), 3.14)
    foo(className(M()), 3.14)
    bar(44)
    unsafe { bar2(44) }
    return 0;
}
