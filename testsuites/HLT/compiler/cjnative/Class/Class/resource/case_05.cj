// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 	 // This source file is part of the Cangjie project, licensed under Apache-2.0
 	 // with Runtime Library Exception.
 	 //
 	 // See https://cangjie-lang.cn/pages/LICENSE for license information.
 	 
 	 // EXEC: %compiler %cmp_opt %f -o %output
 	 // RUN-EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
 	 // ASSERT: scan-2 try
 	 // ASSERT: scan-2 finally
 	 
 	 open class AAA <: Resource {
 	     public func close(a: Bool): Unit {}
 	     public func close(): Unit {}
 	     public func isClosed(): Bool {
 	         return true
 	     }
		 public func isClosed(a: Bool): Bool {
 	         return false
 	     }
		 public func close(a: Int64): Unit {}
 	 }
 	 
 	 class BBB <: AAA {
 	     public func close(a: Float64): Unit {}
		 public func isClosed(a: Int64): Unit {}
 	 }
 	 
 	 main() {
 	     try (aaa = AAA()) {
 	         println("try")
 	     } finally {
 	         println("finally")
 	     }
 	     try (bbb = BBB()) {
 	         println("try")
 	     } finally {
 	         println("finally")
 	     }
 	 }