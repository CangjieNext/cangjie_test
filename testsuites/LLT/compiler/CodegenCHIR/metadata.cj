// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: SerializeMetadata.py
// (not CJNATIVE and DEBUG_OPTION) EXEC: %frontendCompiler %dump-ir %cmp_opt %n.cj > %n.chirtxt.ll
// (CJNATIVE and DEBUG_OPTION) EXEC: %frontendCompiler %dump-ir %cmp_opt -j1 %n.cj > %n.chirtxt.ll
// (CJNATIVE and DEBUG_OPTION) EXEC: %python SerializeMetadata.py %n.chirtxt.ll 2>&1 | compare %f
/*
create by chir:
!pkg_info = !{!{!"", !"testttt"}}
*/
// (CJNATIVE) ASSERT: scan !pkg_info = !{!{!"testttt"!"testttt"}}

/* create by CHIR:
!types = !{!{!"_CN7testttt7StructBE.reflectKlass", !{}, !{!{!"v5", !"l", !{!"public", !"none"}}, !{!"v6", !"l", !{!"immutable", !"public", !"none"}}}, !{!{!"v7", !"l", !"_CN7testttt7StructB2v7E", !{!"public", !"static", !"none"}}, !{!"v8", !"l", !"_CN7testttt7StructB2v8E", !{!"immutable", !"public", !"static", !"none"}}}, !{!{!"f3", !"l", !"_CN7testttt7StructB2f3El", !{!"public", !"none"}, !{!{!"StructB", !"RN7testttt7StructBE", !{!"none"}}, !{!"a", !"l", !{!"none"}}}}, !{!"init", !"u", !"_CN7testttt7StructB6<init>Hv", !{!"public", !"none"}, !{!{!"StructB", !"RN7testttt7StructBE", !{!"none"}}}}, !{!"$toAny", !"CNat3AnyE", !"_CN7testttt7StructB6$toAnyEv", !{!"public", !"none"}, !{!{!"StructB", !"RN7testttt7StructBE", !{!"none"}}}}}, !{!{!"f4", !"l", !"_CN7testttt7StructB2f4El", !{!"public", !"static", !"none"}, !{!{!"a", !"l", !{!"none"}}}}}, !{!"record", !"none"}}, !{!"_CN7testttt25$BOX_CN7testttt6ClassAEE.objKlass", !{!"_CN025$BOX_CN7testttt6ClassAEE", !"_CN7testttt1IE", !"_CNat3AnyE"}, !{}, !{}, !{}, !{}, !{!"box", !"class", !"none"}}, !{!"_CN025$BOX_CN7testttt6ClassAEE.objKlass", !{!"_CN025$BOX_CN7testttt6ClassCEE"}, !{!{!"$value", !"CN7testttt6ClassAE", !{!"immutable", !"public", !"none"}}}, !{}, !{}, !{}, !{!"box", !"class", !"open", !"none"}}, !{!"_CN025$BOX_CN7testttt6ClassCEE.objKlass", !{!"_CN026$BOX_CNat6ObjectEE"}, !{!{!"$value", !"CN7testttt6ClassCE", !{!"immutable", !"public", !"none"}}}, !{}, !{}, !{}, !{!"box", !"class", !"open", !"none"}}, !{!"_CN026$BOX_CNat6ObjectEE.objKlass", !{!"_CNat6ObjectE"}, !{!{!"$value", !"CNat6ObjectE", !{!"immutable", !"public", !"none"}}}, !{}, !{}, !{}, !{!"box", !"class", !"open", !"none"}}, !{!"_CN026$BOX_RN7testttt7StructBEE.objKlass", !{!"_CNat6ObjectE"}, !{!{!"$value", !"RN7testttt7StructBE", !{!"immutable", !"public", !"none"}}}, !{}, !{}, !{}, !{!"box", !"class", !"open", !"none"}}, !{!"_CN7testttt6ClassAE.objKlass", !{!"_CN7testttt6ClassCE", !"_CN7testttt1IE"}, !{!{!"v1", !"l", !{!"public", !"none"}}, !{!"v2", !"l", !{!"immutable", !"public", !"none"}}}, !{!{!"v3", !"l", !"_CN7testttt6ClassA2v3E", !{!"public", !"static", !"none"}}, !{!"v4", !"l", !"_CN7testttt6ClassA2v4E", !{!"immutable", !"public", !"static", !"none"}}}, !{!{!"f1", !"l", !"_CN7testttt6ClassA2f1El", !{!"public", !"none"}, !{!{!"ClassA", !"CN7testttt6ClassAE", !{!"none"}}, !{!"a", !"l", !{!"none"}}}}, !{!"f6", !"u", !"_CN7testttt6ClassA2f6Ev", !{!"public", !"none"}, !{!{!"ClassA", !"CN7testttt6ClassAE", !{!"none"}}}}, !{!"init", !"u", !"_CN7testttt6ClassA6<init>Hv", !{!"public", !"none"}, !{!{!"ClassA", !"CN7testttt6ClassAE", !{!"none"}}}}}, !{!{!"f2", !"l", !"_CN7testttt6ClassA2f2El", !{!"public", !"static", !"none"}, !{!{!"a", !"l", !{!"none"}}}}}, !{!"class", !"public", !"none"}}, !{!"_CN7testttt6ClassCE.objKlass", !{!"_CNat6ObjectE"}, !{}, !{}, !{!{!"f6", !"u", !"", !{!"abstract", !"open", !"public", !"none"}, !{!{!"ClassC", !"CN7testttt6ClassCE", !{!"none"}}}}, !{!"init", !"u", !"_CN7testttt6ClassC6<init>Hv", !{!"public", !"none"}, !{!{!"ClassC", !"CN7testttt6ClassCE", !{!"none"}}}}}, !{}, !{!"abstract", !"class", !"open", !"public", !"none"}}, !{!"_CN7testttt1IE.objKlass", !{}, !{}, !{}, !{}, !{}, !{!"interface", !"open", !"public", !"none"}}}
*/

// (CJNATIVE) ASSERT: regex !types = !{.*!"_CN7testttt7StructBE\.reflectKlass".*!"_CN025\$BOX_CN7testttt6ClassAEE\.objKlass".*!"_CN025\$BOX_CN7testttt6ClassCEE\.objKlass".*!"_CN026\$BOX_CN8std\.core6ObjectEE\.objKlass".*!"_CN026\$BOX_RN7testttt7StructBEE\.objKlass".*!"_CN7testttt1IE\.objKlass".*!"_CN7testttt25\$BOX_CN7testttt6ClassAEE\.objKlass".*!"_CN7testttt6ClassAE\.objKlass".*!"_CN7testttt6ClassCE\.objKlass".*}

// (CJNATIVE) ASSERT: scan !{!"_CN7testttt7StructBE.reflectKlass", !{}, !{!{!"v5", !"l", !{!"public", !"none"}}, !{!"v6", !"l", !{!"immutable", !"public", !"none"}}}, !{!{!"v7", !"l", !"_CN7testttt7StructB2v7E", !{!"public", !"static", !"none"}}, !{!"v8", !"l", !"_CN7testttt7StructB2v8E", !{!"immutable", !"public", !"static", !"none"}}}, !{!{!"f3", !"l", !"_CN7testttt7StructB2f3El", !{!"public", !"none"}, !{!{!"this", !"CRN7testttt7StructBE", !{!"none"}}, !{!"a", !"l", !{!"none"}}}}, !{!"init", !"u", !"_CN7testttt7StructB6<init>Hv", !{!"public", !"none"}, !{!{!"this", !"CRN7testttt7StructBE", !{!"none"}}}}, !{!"$toAny", !"CNat3AnyE", !"_CN7testttt7StructB6$toAnyEv", !{!"public", !"none"}, !{!{!"this", !"CRN7testttt7StructBE", !{!"none"}}}}}, !{!{!"f4", !"l", !"_CN7testttt7StructB2f4El", !{!"public", !"static", !"none"}, !{!{!"a", !"l", !{!"none"}}}}}, !{!"record", !"none"}}

// (CJNATIVE) ASSERT: scan !{!"_CN025$BOX_CN7testttt6ClassAEE.objKlass", !{!"_CN025$BOX_CN7testttt6ClassCEE"}, !{!{!"$value", !"CN7testttt6ClassAE", !{!"immutable", !"public", !"none"}}}, !{}, !{}, !{}, !{!"box", !"class", !"open", !"none"}}

// (CJNATIVE) ASSERT: scan !{!"_CN7testttt6ClassAE.objKlass", !{!"_CN7testttt6ClassCE", !"_CN7testttt1IE"}, !{!{!"v1", !"l", !{!"public", !"none"}}, !{!"v2", !"l", !{!"immutable", !"public", !"none"}}}, !{!{!"v3", !"l", !"_CN7testttt6ClassA2v3E", !{!"public", !"static", !"none"}}, !{!"v4", !"l", !"_CN7testttt6ClassA2v4E", !{!"immutable", !"public", !"static", !"none"}}}, !{!{!"f1", !"l", !"_CN7testttt6ClassA2f1El", !{!"public", !"none"}, !{!{!"this", !"CN7testttt6ClassAE", !{!"none"}}, !{!"a", !"l", !{!"none"}}}}, !{!"f6", !"u", !"_CN7testttt6ClassA2f6Ev", !{!"public", !"none"}, !{!{!"this", !"CN7testttt6ClassAE", !{!"none"}}}}, !{!"init", !"u", !"_CN7testttt6ClassA6<init>Hv", !{!"public", !"none"}, !{!{!"this", !"CN7testttt6ClassAE", !{!"none"}}}}}, !{!{!"f2", !"l", !"_CN7testttt6ClassA2f2El", !{!"public", !"static", !"none"}, !{!{!"a", !"l", !{!"none"}}}}}, !{!"class", !"public", !"none"}}

// (CJNATIVE) ASSERT: scan !{!"_CN7testttt6ClassCE.objKlass", !{!"_CNat6ObjectE"}, !{}, !{}, !{!{!"init", !"u", !"_CN7testttt6ClassC6<init>Hv", !{!"public", !"none"}, !{!{!"this", !"CN7testttt6ClassCE", !{!"none"}}}}, !{!"f6", !"u", !"_CN7testttt6ClassC2f6Ev.0", !{!"abstract", !"open", !"public", !"none"}, !{!{!"this", !"CN7testttt6ClassCE", !{!"none"}}}}}, !{}, !{!"abstract", !"class", !"open", !"public", !"none"}}

// (CJNATIVE) ASSERT: scan !{!"_CN7testttt1IE.objKlass", !{}, !{}, !{}, !{}, !{}, !{!"interface", !"open", !"public", !"none"}}

// (CJNATIVE) ASSERT: scan !{!"_CN025$BOX_CN7testttt6ClassCEE.objKlass", !{!"_CN026$BOX_CNat6ObjectEE"}, !{!{!"$value", !"CN7testttt6ClassCE", !{!"immutable", !"public", !"none"}}}, !{}, !{}, !{}, !{!"box", !"class", !"open", !"none"}}

// (CJNATIVE) ASSERT: scan !{!"_CN026$BOX_CNat6ObjectEE.objKlass", !{!"_CNat6ObjectE"}, !{!{!"$value", !"CNat6ObjectE", !{!"immutable", !"public", !"none"}}}, !{}, !{}, !{}, !{!"box", !"class", !"open", !"none"}}

// (CJNATIVE) ASSERT: scan !{!"_CN026$BOX_RN7testttt7StructBEE.objKlass", !{!"_CNat6ObjectE"}, !{!{!"$value", !"CRN7testttt7StructBE", !{!"immutable", !"public", !"none"}}}, !{}, !{}, !{}, !{!"box", !"class", !"open", !"none"}}

/* create by CHIR:
!global_variables = !{!{!"v9", !"CN7testttt6ClassAE", !"_CN7testttt2v9E", !{!"public", !"none"}}, !{!"v10", !"l", !"_CN7testttt3v10E", !{!"immutable", !"public", !"none"}}}
*/
// (CJNATIVE) ASSERT: scan !global_variables = !{!{!"v9", !"CN7testttt6ClassAE", !"_CN7testttt2v9E", !{!"public", !"none"}}, !{!"v10", !"l", !"_CN7testttt3v10E", !{!"immutable", !"public", !"none"}}}

/* create by CHIR:
!functions = !{!{!"goo", !"l", !"_CN7testttt3gooHCNY_6ClassAE", !{!"public", !"none"}, !{!{!"a", !"CN7testttt6ClassAE", !{!"none"}}}}}
*/
// (CJNATIVE) ASSERT: scan !functions = !{!{!"goo", !"l", !"_CN7testttt3gooHCNY_6ClassAE", !{!"public", !"none"}, !{!{!"a", !"CN7testttt6ClassAE", !{!"none"}}}}, !{!"toAny", !"CNat3AnyE", !"_CN7testttt6Extend6ClassA5toAnyEv", !{!"public", !"none"}, !{!{!"this", !"CN7testttt6ClassAE", !{!"none"}}}}}
package testttt

public interface I {}

public open abstract class ClassC {
    public func f6(): Unit
}

public class ClassA <: ClassC & I {
	public func f1(a: Int64): Int64 {
        return a + 1
    }
    public static func f2(a: Int64): Int64 {
        return a + 10
    }
    public static func f5<T>(a: T): T {
        return a
    }
    public func f6(): Unit {}
    public var v1: Int64 = 2
    public let v2: Int64 = 4
    public static var v3: Int64 = 3
    public static let v4: Int64 = 5
}

extend ClassA {
    public func toAny(): Any {
        this
    }
}

public struct StructB {
    public func f3(a: Int64): Int64 {
        return a + 1
    }
    public static func f4(a: Int64): Int64 {
        return a + 10
    }
    public var v5: Int64 = 2
    public let v6: Int64 = 4
    public static var v7: Int64 = 3
    public static let v8: Int64 = 5
}

public var v9: ClassA = ClassA()
public let v10: Int64 = 123

public func goo(a: ClassA): Int64 {
    return ClassA.f5<Int64>(1234)
}

// Non-public function does not support reflection
func foo() {}

main(): Unit {
}
