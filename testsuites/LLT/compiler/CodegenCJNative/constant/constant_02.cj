// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (DEBUG_OPTION)RUN-EXEC-PIPE: %frontendCompiler %dump-ir-to-screen %cmp_opt --apc=1 %n.cj 2>&1 | compare %f

// ASSERT: regex-1 constant \[3 x i64\] \[i64 1, i64 2, i64 3\]
// ASSERT: regex-1 constant \[4 x i64\] \[i64 1, i64 2, i64 3, i64 4\]
// ASSERT: regex-1 constant \[2 x %"Tuple<Int64,Int32>"\] \[%"Tuple<Int64,Int32>" \{ i64 1, i32 2 \}, %"Tuple<Int64,Int32>" \{ i64 3, i32 4 \}\]
// ASSERT: regex-1 constant \[2 x \[2 x i64\]\] \[\[2 x i64\] \[i64 11, i64 21\], \[2 x i64\] \[i64 31, i64 41\]\]

// ASSERT: regex-begin define internal void @"_CN7defaultUconstant_02\$4foo4Hv".+\n
// ASSERT: regex-after %\d+ = bitcast \[2 x \[2 x i64\]\]\* %\d+ to i8\*, !dbg !\d+
// ASSERT: regex-after call void @llvm\.memcpy\.p0i8\.p0i8\.i64\(i8\* align 8 %\d+, i8\* align 8 bitcast \(\[2 x \[2 x i64\]\]\* @.* to i8\*\), i64 32, i1 false\), !dbg !\d+
// ASSERT: regex-after ret void, !dbg !\d+

// ASSERT: regex-begin define internal i1 @"_CN7defaultUconstant_02\$4foo3Hv".+\n
// ASSERT: regex-after %(?P<id1>\d+) = load i64, i64\* getelementptr inbounds \(\[2 x \[2 x i64\]\], \[2 x \[2 x i64\]\]\* @.*, i64 0, i64 1, i64 1\), align 8, !dbg !\d+
// ASSERT: regex-after %(?P<id2>\d+) = load i64, i64\* getelementptr inbounds \(\[2 x \[2 x i64\]\], \[2 x \[2 x i64\]\]\* @.*, i64 0, i64 1, i64 1\), align 8, !dbg !\d+
// ASSERT: regex-after %icmpeq = icmp eq i64 %(?P=id1), %(?P=id2), !dbg !\d+

func foo1() {
    let a1: Array<Int64> = [1, 2, 3]
    let a2: VArray<Int64, $3> = [1, 2, 3]
    var a3: Array<Int64> = [1, 2, 3]
    var a4: VArray<Int64, $3> = [1, 2, 3]
    [1, 2, 3, 4]
}

func foo2() {
    let a1: Array<(Int64, Int32)> = [(1, 2), (3, 4)]
    let a2: VArray<(Int64, Int32), $2> = [(1, 2), (3, 4)]
}

private func foo3() {
    let a1: VArray<VArray<Int64, $2>, $2> = [[11, 21], [31, 41]]
    let a2: VArray<VArray<Int64, $2>, $2> = [[11, 21], [31, 41]]
    a2[1][1] == a1[1][1]
}

private func foo4(): VArray<VArray<Int64, $2>, $2> {
    [[11, 21], [31, 41]]
}

func foo5() {
    let b = (7, 8, 9)
    let c = (7, 8, 9)
    let d = (7, 8, 9, (7, 8, 9))
    print(d[0])
}

main() {
    foo1()
    foo2()
    foo3()
    foo4()
    foo5()
    0
}

// Ensure that no redundant memory copy instructions exist.
// The more detailed expected function structure is as follows:
/*
define internal void @_CN7default4foo4Ev([2 x [2 x i64]]* noalias sret([2 x [2 x i64]]) %0) #4 gc "cangjie" personality i32 (...)* @"__cj_personality_v0$" !dbg !136 {
entry:
  br label %thunk

thunk:                                            ; preds = %entry
  %1 = bitcast [2 x [2 x i64]]* %0 to i8*, !dbg !137
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %1, i8* align 8 bitcast ([2 x [2 x i64]]* @"$const_array.2" to i8*), i64 32, i1 false), !dbg !137
  ret void, !dbg !137
}

define internal void @_CN7default4foo3Ev(%Unit.Type* noalias sret(%Unit.Type) %0) gc "cangjie" personality i32 (...)* @"__cj_personality_v0$" !dbg !138 {
entry:
  %a2 = alloca [2 x [2 x i64]], align 8
  %a1 = alloca [2 x [2 x i64]], align 8
  br label %thunk

thunk:                                            ; preds = %entry
  %1 = bitcast [2 x [2 x i64]]* %a1 to i8*, !dbg !139
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %1, i8* align 8 bitcast ([2 x [2 x i64]]* @"$const_array.2" to i8*), i64 32, i1 false), !dbg !139
  %2 = bitcast [2 x [2 x i64]]* %a2 to i8*, !dbg !140
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %2, i8* align 8 bitcast ([2 x [2 x i64]]* @"$const_array.2" to i8*), i64 32, i1 false), !dbg !140
  ret void, !dbg !141
}
 */
