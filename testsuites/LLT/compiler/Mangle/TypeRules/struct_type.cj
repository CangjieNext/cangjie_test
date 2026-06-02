// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// (CJNATIVE) EXEC: %compiler %cmp_opt %f --save-temps . --apc=1 -Woff unused --output-type=staticlib
// (CJNATIVE) EXEC: %llvmDissembler %n.bc -o %n.ll
// (CJNATIVE) EXEC: %cat %n.ll 2>&1 | compare %f
// (CJNATIVE) ASSERT: scan define i64 @_CN7default7Struct14areaHv
// (CJNATIVE) ASSERT: scan define void @\"_CN7default7Struct26<init>Hll\"
// (CJNATIVE) ASSERT: scan define void @_CN7default7Struct38typeNameHv
// (CJNATIVE) ASSERT: scan define void @_CN7default7Struct41gHv

struct Struct1 {
    let width: Int64 = 3
    public func area() {
        width * width
    }
}

struct Struct2 {
    public Struct2(let width: Int64, let height: Int64) {}
}

struct Struct3 {
    let width: Int64 = 10
    let height: Int64 = 20

    public func area() {
        this.width * this.height
    }

    public static func typeName(): String {
        "Struct3"
    }
}

struct Struct4 {
    var i = 0

    public mut func g() {
        i += 1 // Ok
    }
}
