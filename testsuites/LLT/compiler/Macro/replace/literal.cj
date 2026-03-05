// DEPENDENCE: macro_test.cj
// EXEC: %compiler %import-cangjie-stdx %cmp_macro macro_test.cj
// ERRCHECK: %run_macro %set_stdx_path %compiler %import-cangjie-stdx %cmp_opt  %f -o %output

import cangjie_stdx::serialization.serialization.*
import test.*

@callTest
class People <: Serializable<People> {
    var name: String

    // 口令
    var password: String

    init(s: DataModelStruct) {
        name = String.deserialize(s.get("name"))
        password = String.deserialize(s.get("password"))
    }

    public func serialize(): DataModel {
        DataModelStruct().add(field<String>("name", name1))
        DataModelStruct().add(field<String>("password", password))
    }

    public static func deserialize(s: DataModel): People {
        let d = (s as DataModelStruct).getOrThrow()
        People(d)
    }
}

main() {}

/* SCAN
error: undeclared identifier 'name1'
  ==> literal.cj:21:53:
   | 
21 |         DataModelStruct().add(field<String>("name", name1))
   |                                                     ^ 
   | 
note: which is expanded as follows
   | 
   | /* 8.13 */        DataModelStruct().add(field < String >("name", name1))
   |                                                                  ^^^^^ 
   | 
note: the error occurs after the macro is expanded
  ==> literal.cj:8:1:
   | 
8  |   @callTest
   |  _^
9  | | class People <: Serializable<People> {
   | | ...
29 | | }
   | |_^
   | 
note: the code after the macro is expanded as follows
   | 
   |   /* 8.1 */class People <: Serializable < People > {
   |  _^
   | | /* 8.2 */    var name: String
   | | /* 8.3 */    
   | | /* 8.4 */    
   | | /* 8.5 */    var password: String
   | | /* 8.6 */    
   | | /* 8.7 */    init(s: DataModelStruct) {
   | | /* 8.8 */        name = String.deserialize(s.get("name"))
   | | /* 8.9 */        password = String.deserialize(s.get("password"))
   | | /* 8.10 */    }
   | | /* 8.11 */    
   | | /* 8.12 */    public func serialize(): DataModel {
   | | /* 8.13 */        DataModelStruct().add(field < String >("name", name1))
   | | /* 8.14 */        DataModelStruct().add(field < String >("password", password))
   | | /* 8.15 */    }
   | | /* 8.16 */    
   | | /* 8.17 */    public static func deserialize(s: DataModel): People {
   | | /* 8.18 */        let d =(s as DataModelStruct).getOrThrow()
   | | /* 8.19 */        People(d)
   | | /* 8.20 */    }
   | | /* 8.21 */}
   | |___________^
   | 

1 error generated, 1 error printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

