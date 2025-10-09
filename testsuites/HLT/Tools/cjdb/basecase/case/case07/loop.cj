/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

main(){
	var test_var = 0
	let intRange = 0..3

	for (i in intRange){
	    test_var += 1
	}

	do{
            test_var -= 1
	}while(test_var>0)

	while(test_var<3){
	    test_var += 1
	}

	return 0
}
