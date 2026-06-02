// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

/// RUN-EXEC-PIPE: %frontendCompiler %dump-ir-to-screen %cmp_opt %n.cj 2>&1 | compare %f

/// ASSERT: regex-1 private unnamed_addr constant \[3 x \[5 x i64\]\] \[\[5 x i64\] \[i64 1, i64 2, i64 3, i64 4, i64 5]\, \[5 x i64\] \[i64 11, i64 12, i64 13, i64 14, i64 15\], \[5 x i64\] \[i64 111, i64 112, i64 113, i64 114, i64 115\]\], align 8

/// ASSERT: regex-begin define internal void @_CN7default4foo1Ev.+\n
/// ASSERT: regex-after %\d+ = call noalias i8 addrspace\(1\)\* @llvm\.cj\.gcmalloc\.array\(i64 3, i8\* bitcast \(%KlassInfo\.0\* @V5_lE\.arrayKlass to i8\*\)\), !dbg !\d+
/// ASSERT: regex-after %\d+ = bitcast i8 addrspace\(1\)\* %\d+ to %ArrayLayout\.V5_lE addrspace\(1\)\*, !dbg !\d+
/// ASSERT: regex-after %\d+ = getelementptr inbounds %ArrayLayout\.V5_lE, %ArrayLayout\.V5_lE addrspace\(1\)\* %\d+, i32 0, i32 1, !dbg !\d+
/// ASSERT: regex-after %\d+ = bitcast \[0 x \[5 x i64\]\] addrspace\(1\)\* %\d+ to i8 addrspace\(1\)\*, !dbg !\d+
/// ASSERT: regex-after %\d+ = getelementptr inbounds i8, i8 addrspace\(1\)\* %\d+, i64 0, !dbg !\d+
/// ASSERT: regex-after call void @llvm\.cj\.array\.copyto\(i8 addrspace\(1\)\* %\d+, i8 addrspace\(1\)\* %\d+, i8 addrspace\(1\)\* addrspacecast \(i8\* bitcast \(\[3 x \[5 x i64\]\]\* @\"\$const_array\.\d+\" to i8\*\) to i8 addrspace\(1\)\*\), i8 addrspace\(1\)\* addrspacecast \(i8\* bitcast \(\[3 x \[5 x i64\]\]\* @\"\$const_array\.\d+\" to i8\*\) to i8 addrspace\(1\)\*\), i64 120\), !dbg !\d+
/// ASSERT: regex-after %\d+ = bitcast %\"record\._CN8std\.core5ArrayIV4_lEE\"\* %\d+ to i8\*, !dbg !\d+

func foo1() {
    var arr1: Array<VArray<Int64, $5>> = [[1, 2, 3, 4, 5], [11, 12, 13, 14, 15], [111, 112, 113, 114, 115]]
}

main() {
    foo1()
    0
}

// Ensure that no redundant memory copy instructions exist.
// The more detailed expected function structure is as follows:
/*
define internal void @_CN4foo1Ev(%Unit.Type* noalias sret(%Unit.Type) %0) gc "cangjie" personality i32 (...)* @"__cj_personality_v0$" !dbg !99 {
entry:
  %arr1 = alloca %"record._CNat5ArrayIV4_lEE", align 8
  %1 = alloca %"record._CNat5ArrayIV4_lEE", align 8
  br label %thunk

thunk:                                            ; preds = %entry
  %2 = call noalias i8 addrspace(1)* @llvm.cj.gcmalloc.array(i64 3, i8* bitcast (%KlassInfo.0* @V5_lE.arrayKlass to i8*)), !dbg !101
  %3 = bitcast i8 addrspace(1)* %2 to %ArrayLayout.V5_lE addrspace(1)*, !dbg !101
  %4 = getelementptr inbounds %ArrayLayout.V5_lE, %ArrayLayout.V5_lE addrspace(1)* %3, i32 0, i32 1, !dbg !101
  %5 = bitcast [0 x [5 x i64]] addrspace(1)* %4 to i8 addrspace(1)*, !dbg !101
  %6 = getelementptr inbounds i8, i8 addrspace(1)* %5, i64 0, !dbg !101
  call void @llvm.cj.array.copyto(i8 addrspace(1)* %2, i8 addrspace(1)* %6, i8 addrspace(1)* addrspacecast (i8* bitcast ([3 x [5 x i64]]* @"$const_array.3" to i8*) to i8 addrspace(1)*), i8 addrspace(1)* addrspacecast (i8* bitcast ([3 x [5 x i64]]* @"$const_array.3" to i8*) to i8 addrspace(1)*), i64 120), !dbg !101
  %7 = bitcast %"record._CNat5ArrayIV4_lEE"* %1 to i8*, !dbg !101
  call void @llvm.cj.memset.p0i8(i8* align 8 %7, i8 0, i64 24, i1 false), !dbg !101
  %8 = addrspacecast %"record._CNat5ArrayIV4_lEE"* %1 to %"record._CNat5ArrayIV4_lEE" addrspace(1)*, !dbg !101
  call void @"_CNat5ArrayIV5_lE6<init>EA1_V5_lEEll"(i8 addrspace(1)* null, %"record._CNat5ArrayIV4_lEE" addrspace(1)* %8, i8 addrspace(1)* %2, i64 0, i64 3), !dbg !101
  %9 = bitcast %"record._CNat5ArrayIV4_lEE"* %arr1 to i8*, !dbg !102
  call void @llvm.cj.memset.p0i8(i8* align 8 %9, i8 0, i64 24, i1 false), !dbg !102
  %10 = bitcast %"record._CNat5ArrayIV4_lEE"* %arr1 to i8*, !dbg !102
  %11 = bitcast %"record._CNat5ArrayIV4_lEE"* %1 to i8*, !dbg !102
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %10, i8* align 8 %11, i64 24, i1 false), !dbg !102
  ret void, !dbg !103
}
 */
