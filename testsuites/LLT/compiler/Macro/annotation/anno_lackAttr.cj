// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_macro define.cj
// ERRCHECK: %compiler %cmp_opt %f -o %output

import define.M0

@Annotation[target: [MemberFunction]]
public class FunctionDefinition {
    public const FunctionDefinition(
        public let name!: String,
        public let description!: String
    ){}
}


@M0
public class TodoFunction {
    @FunctionDefinition[
        name: 'addTodo',
        description: 'add todo'
    ]
    public func addTodo(param: String) {
        return 0
    }


    @FunctionDefinition[
        name: 'updateTodoStatus'
    ]
    public func update(param: String) {
        return 0
    }
}

main() {}

/* SCAN
error: missing argument for parameter list '(Struct-String, Struct-String)' in call
   | 
   |   /* 22.10 */    @FunctionDefinition[name: 'updateTodoStatus'
   |  ________________^
   | | /* 22.11 */    ]
   | |________________^ expected 2 arguments, found 1
   | 
note: the error occurs after the macro is expanded
  ==> anno_lackAttr.cj:22:1:
   | 
22 |   @M0
   |  _^
23 | | public class TodoFunction {
   | | ...
39 | | }
   | |_^
   | 
note: the code after the macro is expanded as follows
   | 
   |   /* 22.1 */public class TodoFunction {
   |  _^
   | | /* 22.2 */    @FunctionDefinition[name: 'addTodo',
   | | /* 22.3 */    description: 'add todo'
   | | /* 22.4 */    ]
   | | /* 22.5 */    public func addTodo(param: String) {
   | | /* 22.6 */        return 0
   | | /* 22.7 */    }
   | | /* 22.8 */    
   | | /* 22.9 */    
   | | /* 22.10 */    @FunctionDefinition[name: 'updateTodoStatus'
   | | /* 22.11 */    ]
   | | /* 22.12 */    public func update(param: String) {
   | | /* 22.13 */        return 0
   | | /* 22.14 */    }
   | | /* 22.15 */}
   | |____________^
   | 
note: found candidate
  ==> anno_lackAttr.cj:15:18:
   | 
15 |     public const FunctionDefinition(
   |                  ^^^^^^^^^^^^^^^^^^ 
   | 

1 error generated, 1 error printed.
*/