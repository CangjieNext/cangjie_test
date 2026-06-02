// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (DEBUG_OPTION)EXEC-PIPE-0: %frontendCompiler %dump-ir-to-screen %cmp_opt %compile_lib_opt -j1 %f 2>&1 | compare %f
// ASSERT: regex-auto @"default:IA<T>_ed_default:IA<T>" = private global %ExtensionDef { i32 1, i8 0, i16 1, i8* bitcast (%TypeTemplate* @"default:IA.tt" to i8*), i8* bitcast (i8* (i32, %TypeInfo**)* @"default:IA<T>_ed_default:IA<T>_iFn" to i8*), i8* null
// ASSERT: regex-auto @"default:IB_ed_default:IB" = private global %ExtensionDef { i32 0, i8 1, i16 1, i8* bitcast (%TypeInfo* @"default:IB.ti" to i8*), i8* bitcast (%TypeInfo* @"default:IB.ti" to i8*), i8* null
// ASSERT: regex-auto @"default:CA_ed_default:IA<Bool>" = private global %ExtensionDef { i32 0, i8 1, i16 1, i8* bitcast (%TypeInfo* @"default:CA.ti" to i8*), i8* bitcast (%TypeInfo* @"default:IA<Bool>.ti" to i8*), i8* null
// ASSERT: regex-auto @"default:CB<T>_ed_default:IA<T>" = private global %ExtensionDef { i32 1, i8 0, i16 1, i8* bitcast (%TypeTemplate* @"default:CB.tt" to i8*), i8* bitcast (i8* (i32, %TypeInfo**)* @"default:CB<T>_ed_default:IA<T>_iFn" to i8*), i8* null
// ASSERT: regex-auto @"default:CC<T>_ed_default:IA<T>" = private global %ExtensionDef { i32 1, i8 0, i16 1, i8* bitcast (%TypeTemplate* @"default:CC.tt" to i8*), i8* bitcast (i8* (i32, %TypeInfo**)* @"default:CC<T>_ed_default:IA<T>_iFn" to i8*), i8* bitcast (i1 (i32, %TypeInfo**)* @"default:CC<T>_ed_default:IA<T>_cs" to i8*)
// ASSERT: regex-auto @NonExternalExtensionDefs = private global [12 x %ExtensionDef*]

public interface IA<T> {
    static func mmm() {}
}

public interface IB {
    static func mmm() {}
}

public open class CA {}

extend CA <: IA<Bool> {}

public class CB<T> {}

extend<T> CB<T> <: IA<T> {}

public class CC<T> {}

extend<T> CC<T> <: IA<T> where T <: CA {}
