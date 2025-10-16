// DEPENDENCE: %n.old.cj %n.new.cj
// EXEC: %compiler %incrementalCompile %cmp_opt %n.old.cj -o %output
// EXEC: %run %run_opt %output %run_args
// EXEC: %rmfile %n.old.cj
// EXEC: %move %n.new.cj %n.old.cj
// EXEC-PIPE-0: %compiler %incrementalCompile %cmp_opt %n.old.cj -o %output 2>&1 | compare %f
+	C 7default1CS InstanceMethod_ToMut_Full.old.cj 7: 
+	    changed members 1:
+	         7default1CS3fooF$$l: srcuse 
+	A 7default1AI InstanceMethod_ToMut_Full.old.cj 1: virtual 
+	    changed members 1:
+	         7default1AI3fooF$$l: srcuse 
// ASSERT: scan changed decls to recompile: 6
// ASSERT: scan the changed decl after Spreading is:A in file InstanceMethod_ToMut_Full.old.cj in line 1 in column 11
// ASSERT: scan the changed decl after Spreading is:foo in file InstanceMethod_ToMut_Full.old.cj in line 2 in column 14
// ASSERT: scan the changed decl after Spreading is:B in file InstanceMethod_ToMut_Full.old.cj in line 4 in column 7
// ASSERT: scan the changed decl after Spreading is:C in file InstanceMethod_ToMut_Full.old.cj in line 7 in column 8
// ASSERT: scan the changed decl after Spreading is:foo in file InstanceMethod_ToMut_Full.old.cj in line 8 in column 21
// ASSERT: scan the changed decl after Spreading is:main in file InstanceMethod_ToMut_Full.old.cj in line 10 in column 1
// EXEC: %run %run_opt %output %run_args


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
