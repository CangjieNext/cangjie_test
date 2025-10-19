// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package cjworld

import interoplib.objc.*
import objc.lang.*

type PrimitiveType = Float64

@ObjCMirror
open class M {
    @ForeignName["init"]
    public init()

    @ForeignName["instantiateOptionF"]
    public func instantiateOptionF(): Option<F>

    @ForeignName["instantiateOptionFNil"]
    public func instantiateOptionFNil(): Option<F>

    @ForeignName["oneParamOption:"]
    public func oneParamOption(param: Option<F>): Unit
}

// open class M1 {
//     public var obj: Int64 = 0
//     public func oneParam(first: Int64): ?F1 {
//         unsafe {
//             let tmp = objCCall(first)
//             match(tmp.$obj.isNull()) {
//                 case true => Some(F1(tmp.$obj))
//                 case _ => None
//             }
//         }
//     }

//     private unsafe func objCCall(first: Int64): CPointer<Int64> {
//         let ptr = LibC.malloc<Int64>()
//         ptr.write(first)
//         ptr
//     }
// }

// open class F1 {
//     F1(obj: CPointer<Int64>){}
// }