// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 	 // This source file is part of the Cangjie project, licensed under Apache-2.0
 	 // with Runtime Library Exception.
 	 //
 	 // See https://cangjie-lang.cn/pages/LICENSE for license information.
 	 
 	 // EXEC: %compiler %cmp_opt %f -o %output
 	 // RUN-EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
 	 // ASSERT: scan close_Bool
 	 // ASSERT: scan close_none
	 // ASSERT: scan close_Int64
	 // ASSERT: scan close_Float64
	 // ASSERT: scan isClosed_none
	 // ASSERT: scan isClosed_Bool
     // ASSERT: scan isClosed_Int64
 	 
 	 open class AAA <: Resource {
 	     public func close(a: Bool): Unit {
			println("close_Bool")
		 }
 	     public func close(): Unit {
			println("close_none")
		 }
 	     public func isClosed(): Bool {
 	         println("isClosed_none")
			 return true
 	     }
		 public func close(a: Int64): Unit {
			println("close_Int64")
		 }
		 public func isClosed(a: Bool): Bool {
 	         println("isClosed_Bool")
			 return true
 	     }
 	 }
 	 
 	 class BBB <: AAA {
 	     public func close(a: Float64): Unit {
			println("close_Float64")
		 }
		 public func isClosed(a: Int64): Unit {
			println("isClosed_Int64")
		 }
 	 }
 	 
 	 main() {
		var aaa = AAA()
		var bbb = BBB()
		aaa.close()
		aaa.close(true)
		aaa.close(25)
		bbb.close(25.0)
		bbb.isClosed()
		bbb.isClosed(true)
		bbb.isClosed(25)

 	 }