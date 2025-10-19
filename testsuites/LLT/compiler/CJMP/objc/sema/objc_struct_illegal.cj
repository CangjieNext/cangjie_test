// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE and not Windows) EXEC-PIPE-1: %compiler %cmp_opt %f -o %output %compile_shared_lib_opt %import_objc_interop 2>& 1 | compare %f

/* SCAN-IN
error: Objective-C mirror field type must be Objective-C compatible
  ==> objc_struct_illegal.cj:44:23:
   | 
44 |     public var start: Point2D
   |                       ^^^^^^^ 
   | 

error: Objective-C mirror field type must be Objective-C compatible
  ==> objc_struct_illegal.cj:45:21:
   | 
45 |     public var end: Point2D
   |                     ^^^^^^^ 
   | 

error: param type of Objective-C mirror constructor must be Objective-C compatible
  ==> objc_struct_illegal.cj:47:17:
   | 
47 |     public init(start: Point2D, end: Point2D) {
   |                 ^^^^^^^^^^^^^^ 
   | 

error: param type of Objective-C mirror constructor must be Objective-C compatible
  ==> objc_struct_illegal.cj:47:33:
   | 
47 |     public init(start: Point2D, end: Point2D) {
   |                                 ^^^^^^^^^^^^ 
   | 
*/

import interoplib.objc.*
import objc.lang.*

@ObjCImpl
public class Line <: Shape {
    public var start: Point2D
    public var end: Point2D

    public init(start: Point2D, end: Point2D) {
        this.start = start
        this.end = end
    }
}

public struct Point2D {
    var x: Float32
    var y: Float32

    init(x: Float32, y: Float32) {
        this.x = x
        this.y = y
    }
}

@ObjCMirror
public open class Shape {
    init()
}
