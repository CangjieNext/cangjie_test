// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE-0: %compiler %dumpCHIRDebug --fchir-function-inlining -Woff all %f -o %n.%suffix
// EXEC-PIPE-0: %run %run_opt %output %run_args
// (Linux) EXEC: %cat %n\_CHIR/[0-9]*_FunctionInline.chirtxt | sed -n -r '/Func @_CN7default8TypeInfo11annotationspgHv.*/,/^}$/p' | compare %f
// (Linux) ASSERT: regex-not GetRTTIStatic.*This
// (Linux) ASSERT: regex-not InvokeStatic\(.*This.*of

open class TypeInfo {
    public static func of(): Unit {
        getOrCreate()
    }

    static func getOrCreate(): Unit {
        let a = ('a', "1", "12321321", 1231321)
        let b = ('a', "1", "12321321", 1231321)
        let c = ('a', "1", "12321321", 1231321)
        let d = ('a', "1", "12321321", 1231321)
        let e = ('a', "1", "12321321", 1231321)
        let f = ('a', "1", "12321321", 1231321)
        let g = ('a', "1", "12321321", 1231321)
        let h = ('a', "1", "12321321", 1231321)
        let i = ('a', "1", "12321321", 1231321)
        let j = ('a', "1", "12321321", 1231321)
    }

    prop annotations: Array<Int64> {
        get() {
            TypeInfo.of()
            return [1, 2, 3]
        }
    }
}

class tt <: TypeInfo {
}

main() {
}