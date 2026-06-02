// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args

internal import std.ast.*

main() {
    var tokens = quote(
    public operator func == ( that : HashSet < T > ) : Bool {
    	if ( this . size != that . size ) {
    		return false
    	}  
    	for ( key in that where ! this . contains ( key ) ) {  
    		return false  
    	}  
    	return true
    }
	)
    if ((parseDecl(tokens) as FuncDecl).getOrThrow().overloadOp.size == 0) {
        return 1
    }
    return 0
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
