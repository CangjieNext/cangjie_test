// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %n.cj %diag_json -o %output 2>&1 | compare %f

public struct myRecord {
    public var myString: String = """
hello world!"""
    public var id: Int64

    public init(id: Int64) {
        this.id = id
    }
}

public struct myGenericRecord<T> {
    public var field: T

    public init(id: T) {
        this.field = id
    }
}

let myList: Any = [myRecord(1), myRecord(2)]
let myGenericInstance: Any = myGenericRecord<String>("`")
let myInstance: Any = myRecord(0)

main(): Int64 {
    var result: Int64 = 0

    if (!(myRecord(3) is Any)) {
        result = 1
    }
    if (!(#"\\\`"# is Any)) {
        result = 2
    }
    if (!(myGenericRecord<Float64>(1.0) is Any)) {
        result = 3
    }
    if (!([] is Any)) {
        result = 4
    }

    if ((myInstance as myRecord).getOrThrow().id != 0) {
        result = 4
    }

    if ((myGenericInstance as myGenericRecord<String>).getOrThrow().field != "`") {
        result = 5
    }

    if ((myList as List<myRecord> ?? []).get(0).field != 1) {
        result = 6
    }

    return result
}
// ASSERT: scan sema_undeclared_type_name
// ASSERT: scan sema_empty_arrayLit_type_undefined
