// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

// RUN-EXEC-PIPE: %frontendCompiler %dump-ir-to-screen %cmp_opt %n.cj 2>&1 | compare %f

// ASSERT: regex-1 private unnamed_addr constant \[3 x \[5 x i64\]\] \[\[5 x i64\] \[i64 1, i64 2, i64 3, i64 4, i64 5]\, \[5 x i64\] \[i64 11, i64 12, i64 13, i64 14, i64 15\], \[5 x i64\] \[i64 111, i64 112, i64 113, i64 114, i64 115\]\], align 8

// ASSERT: regex-begin define void @_CN7default4foo1Hv\(%Unit.Type\* noalias sret\(%Unit.Type\) %0\)
// ASSERT: regex-after %\d+ = call noalias i8 addrspace\(1\)\* @llvm\.cj\.malloc\.array\(i8\* bitcast \(%TypeInfo\* @\"RawArray<VArray<Int64,5>>\.ti\" to i8\*\), i64 3, i64 40\), !dbg !\d+
// ASSERT: regex-after %\d+ = bitcast i8 addrspace\(1\)\* %\d+ to i8\* addrspace\(1\)\*, !dbg !\d+
// ASSERT: regex-after %ti\.payload = getelementptr i8\*, i8\* addrspace\(1\)\* %\d+, i32 1, !dbg !\d+
// ASSERT: regex-after %\d+ = bitcast i8\* addrspace\(1\)\* %ti\.payload to %\"ArrayLayout\.VArray<Int64,5>\" addrspace\(1\)\*, !dbg !\d+
// ASSERT: regex-after %\d+ = getelementptr inbounds %\"ArrayLayout\.VArray<Int64,5>\", %\"ArrayLayout\.VArray<Int64,5>\" addrspace\(1\)\* %\d+, i32 0, i32 1, !dbg !\d+
// ASSERT: regex-after %\d+ = bitcast \[0 x \[5 x i64\]\] addrspace\(1\)\* %\d+ to i8 addrspace\(1\)\*, !dbg !\d+
// ASSERT: regex-after %\d+ = getelementptr inbounds i8, i8 addrspace\(1\)\* %\d+, i64 0, !dbg !\d+
// ASSERT: regex-after call void @llvm\.memmove\.p1i8\.p1i8\.i64\(i8 addrspace\(1\)\* align 8 %\d+, i8 addrspace\(1\)\* align 8 addrspacecast \(i8\* bitcast \(\[3 x \[5 x i64\]\]\* @\"\$const_array\.\S+\" to i8\*\) to i8 addrspace\(1\)\*\), i64 120, i1 false\), !dbg !\d+
// ASSERT: regex-after %\d+ = bitcast %\"record\.std\.core:Array<T>\"\* %\d+ to i8\*, !dbg !\d+

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
define void @_CN7default4foo1Hv(%Unit.Type* noalias sret(%Unit.Type) %0) gc "cangjie" personality i32 (...)* @"__cj_personality_v0$" !dbg !46 {
allocas:
  %arr1 = alloca %"record.std.core:Array<T>", align 8
  %1 = alloca %"record.std.core:Array<T>", align 8
  %2 = alloca %"record.std.core:Array<T>", align 8
  br label %bb0

bb0:                                              ; preds = %allocas
  %3 = call noalias i8 addrspace(1)* @llvm.cj.malloc.array(i8* bitcast (%TypeInfo* @"RawArray<VArray<Int64,5>>.ti" to i8*), i64 3, i64 40), !dbg !48
  %4 = bitcast i8 addrspace(1)* %3 to i8* addrspace(1)*, !dbg !49
  %ti.payload = getelementptr i8*, i8* addrspace(1)* %4, i32 1, !dbg !49
  %5 = bitcast i8* addrspace(1)* %ti.payload to %"ArrayLayout.VArray<Int64,5>" addrspace(1)*, !dbg !49
  %6 = getelementptr inbounds %"ArrayLayout.VArray<Int64,5>", %"ArrayLayout.VArray<Int64,5>" addrspace(1)* %5, i32 0, i32 1, !dbg !49
  %7 = bitcast [0 x [5 x i64]] addrspace(1)* %6 to i8 addrspace(1)*, !dbg !49
  %8 = getelementptr inbounds i8, i8 addrspace(1)* %7, i64 0, !dbg !49
  call void @llvm.memmove.p1i8.p1i8.i64(i8 addrspace(1)* align 8 %8, i8 addrspace(1)* align 8 addrspacecast (i8* bitcast ([3 x [5 x i64]]* @"$const_array.4SoRuf47tx7" to i8*) to i8 addrspace(1)*), i64 120, i1 false), !dbg !49
  %9 = bitcast %"record.std.core:Array<T>"* %1 to i8*
  call void @llvm.cj.memset.p0i8(i8* align 8 %9, i8 0, i64 24, i1 false)
  %10 = addrspacecast %"record.std.core:Array<T>"* %1 to %"record.std.core:Array<T>" addrspace(1)*, !dbg !48
  call void @"_CNat5ArrayIG_E6<init>HA0_G_ll"(%"record.std.core:Array<T>" addrspace(1)* %10, i8 addrspace(1)* null, i8 addrspace(1)* %3, i64 0, i64 3, %TypeInfo* @"std.core:Array<VArray<Int64,5>>.ti"), !dbg !48
  %11 = bitcast %"record.std.core:Array<T>"* %2 to i8*
  call void @llvm.cj.memset.p0i8(i8* align 8 %11, i8 0, i64 24, i1 false)
  %12 = bitcast %"record.std.core:Array<T>"* %2 to i8*, !dbg !49
  %13 = bitcast %"record.std.core:Array<T>"* %1 to i8*, !dbg !49
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %12, i8* align 8 %13, i64 24, i1 false), !dbg !49
  %14 = bitcast %"record.std.core:Array<T>"* %arr1 to i8*
  call void @llvm.cj.memset.p0i8(i8* align 8 %14, i8 0, i64 24, i1 false)
  %15 = bitcast %"record.std.core:Array<T>"* %arr1 to i8*, !dbg !50
  %16 = bitcast %"record.std.core:Array<T>"* %2 to i8*, !dbg !50
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %15, i8* align 8 %16, i64 24, i1 false), !dbg !50
  ret void, !dbg !51
}
 */
