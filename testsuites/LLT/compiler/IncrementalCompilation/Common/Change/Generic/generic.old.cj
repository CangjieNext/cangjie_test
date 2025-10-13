// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args











interface I < X, Y > { 
    func cjTest29410152283239549() { 
        println("newfunc! No used! Just for Test") 
    } 
    
    func cjTest29410152283258087() { 
        println("newfunc! No used! Just for Test") 
    } 
    
    @OverflowSaturating 
    static func foo < X >(a: X): X { 
        a 
    } 
} 

class A < X, Y > <: I < X, Y > { 
    func cjTest29410152283794049() { 
        println("newfunc! No used! Just for Test") 
    } 
    
    func cjTest29410152283801381() { 
        println("newfunc! No used! Just for Test") 
    } 
} 

main() { 
    return A < Int64, Int32 >.foo < Int64 >(0) 
} 



// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
