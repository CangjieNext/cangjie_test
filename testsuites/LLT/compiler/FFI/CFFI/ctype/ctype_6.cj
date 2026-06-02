// EXEC-PIPE-1: %compiler %ulimit-error %noColor %cmp_opt_chir2hlir %verbose_opt %f -o %output 2>&1 | compare %f

foreign func printf(fmt: Data, ...): Int32

func foo0(a: Any) {}
func foo1(a: CType) {}
func foo2(a: Any, b: CType) {}

@C
struct Data {}

main() {
    foo0(1)
    foo0(Data())
    foo1(1)
    foo1(Data())
    foo2(1, Data())
    foo2(Data(), 1)

    var i = 1
    var d = Data()
    foo0(i)
    foo0(d)
    foo1(i)
    foo1(d)
    foo2(i, d)
    foo2(d, i)

    var first = Data()
    unsafe {
        printf(first, 1, Data())
        printf(first, Data(), 1)
        printf(first, i, d)
        printf(first, d, i)
    }
    0
}

/* SCAN-IN
error: struct with @C cannot implicitly used as 'Interface-Any'
  ==> ctype_6.cj:14:10:
   | 
14 |     foo0(Data())
   |          ^ 
   | 

error: struct with @C cannot implicitly used as 'Interface-CType'
  ==> ctype_6.cj:16:10:
   | 
16 |     foo1(Data())
   |          ^ 
   | 

error: struct with @C cannot implicitly used as 'Interface-CType'
  ==> ctype_6.cj:17:13:
   | 
17 |     foo2(1, Data())
   |             ^ 
   | 

error: struct with @C cannot implicitly used as 'Interface-Any'
  ==> ctype_6.cj:18:10:
   | 
18 |     foo2(Data(), 1)
   |          ^ 
   | 

error: struct with @C cannot implicitly used as 'Interface-Any'
  ==> ctype_6.cj:23:10:
   | 
23 |     foo0(d)
   |          ^ 
   | 

error: struct with @C cannot implicitly used as 'Interface-CType'
  ==> ctype_6.cj:25:10:
   | 
25 |     foo1(d)
   |          ^ 
   | 

error: struct with @C cannot implicitly used as 'Interface-CType'
  ==> ctype_6.cj:26:13:
   | 
26 |     foo2(i, d)
   |             ^ 
   | 

error: struct with @C cannot implicitly used as 'Interface-Any'
  ==> ctype_6.cj:27:10:
   | 
27 |     foo2(d, i)
   |          ^ 
   | 
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
