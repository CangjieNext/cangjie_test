// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix
/// (DEBUG_OPTION)EXEC: %frontendCompiler %dump-ir-to-screen %cmp_opt %n.cj 2>&1 | compare %f

/// ASSERT: regex-begin %(?P<id_1>\d+) = bitcast %"record\..*"\* %o to i8\*, !dbg !\d+
/// ASSERT: regex-next call void @llvm\.cj\.memset\.p0i8\(i8\* align 8 %(?P=id_1), i8 0, i64 24, i1 false\), !dbg !\d+
/// ASSERT: regex-next %(?P<id1>\d+) = bitcast %"record\..*"\* %o to i8\*, !dbg !\d+
/// ASSERT: regex-next %(?P<id2>\d+) = bitcast %"record\..*"\* %enum\.val to i8\*, !dbg !\d+
/// ASSERT: regex-next call void @llvm\.memcpy\.p0i8\.p0i8\.i64\(i8\* align 8 %(?P=id1), i8\* align 8 %(?P=id2), i64 24, i1 false\)

/// ASSERT: regex-after %(?P<id3>\d+) = getelementptr inbounds %"record\..*"\* %o, i32 0, i32 0
/// ASSERT: regex-next %(?P<id4>\d+) = load i1, i1\* %(?P=id3), align 1, !dbg !\d+
/// ASSERT: regex-next %icmpeq = icmp eq i1 %(?P=id4), false, !dbg !\d+

/// ASSERT: regex-after %(?P<id5>\d+) = getelementptr inbounds %"record\..*"\* %o, i32 0, i32 1, !dbg !\d+

/// ASSERT: regex-next %(?P<id_6>\d+) = bitcast %_CN07ClosureE\* %x to i8\*, !dbg !\d+
/// ASSERT: regex-next call void @llvm\.cj\.memset\.p0i8\(i8\* align 8 %(?P=id_6), i8 0, i64 16, i1 false\), !dbg !\d+
/// ASSERT: regex-next %(?P<id6>\d+) = bitcast %_CN07ClosureE\* %x to i8\*, !dbg !\d+
/// ASSERT: regex-next %(?P<id7>\d+) = bitcast %_CN07ClosureE\* %(?P=id5) to i8\*, !dbg !\d+
/// ASSERT: regex-next call void @llvm\.memcpy\.p0i8\.p0i8\.i64\(i8\* align 8 %(?P=id6), i8\* align 8 %(?P=id7), i64 16, i1 false\), !dbg !\d+

func foo() {
    println("foo")
}

main() {
    var o = Option<() -> Unit>.Some(foo)
    (o ?? {=> println("error")})()
    0
}
