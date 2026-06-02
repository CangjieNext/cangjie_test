// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// (CJNATIVE) EXEC: %compiler %cmp_opt %f --save-temps . --apc=1 -Woff unused --output-type=staticlib
// (CJNATIVE) EXEC: %llvmDissembler %n.bc -o %n.ll
// (CJNATIVE) EXEC: %cat %n.ll 2>&1 | compare %f
// (CJNATIVE) ASSERT: scan define i64 @_CN7default9Rectangle4areaHv
// (CJNATIVE) ASSERT: scan define void @\"_CN7default11AbRectangle6<init>Hv\"
// (CJNATIVE) ASSERT: scan @_CN7default15RectangleMember6heightE
// (CJNATIVE) ASSERT: scan define void @\"_CN7default13RectangleInit6<init>HRNat6StringEll\"
// (CJNATIVE) ASSERT: scan define void @\"_CN7default1A6<init>Hv\"
// (CJNATIVE) ASSERT: scan define void @\"_CN7default1C5~initHv\"

// general class
class Rectangle {
    let width: Int64
    let height: Int64

    public init(width: Int64, height: Int64) {
        this.width = width
        this.height = height
    }

    public func area() {
        width * height
    }
}

// abstract class
abstract class AbRectangle {
    public func foo(): Unit
}

// static class member
class RectangleMember {
    let width = 10
    static let height = 20
}

// class init
class RectangleInit {
    public RectangleInit(name: String, let width: Int64, let height: Int64) {}
}

// open modifier class
open class A {
    init() {
        println("I'm A")
    }
}

func foo(a: Int64) {}

class B <: A {
    var x = foo(0)
    init() {
        x = foo(1)
        println("init B finished")
    }
}

// class finalizer
class C {
    init(s: String) {
        println(s)
    }
    ~init() {}
}
