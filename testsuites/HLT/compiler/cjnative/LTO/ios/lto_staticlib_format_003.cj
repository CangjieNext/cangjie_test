// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package tmp_test
import my_test2.*

// LEVEL: 1

// DEPENDENCE: my_test1.cj my_test2.cj
// (target_ios_simulator)EXEC: %compiler %compilation_options %extra_options %sanitizer_options %mock_options %optimization_options %debug_options %linkage_options %compile_lib_opt --experimental --lto=full my_test2.cj --lto-staticlib-format=native --output-type=staticlib  -o libmy_test2.a
// (target_ios_simulator)EXEC: %compiler  --lto-keep-pkg-visibility="my_test1,my_test3" %compilation_options %extra_options %sanitizer_options %mock_options %optimization_options %debug_options %linkage_options %compile_lib_opt --experimental --lto=full my_test1.cj libmy_test2.a --output-type=staticlib  --lto-staticlib-format=native -o libmy_test1.a 
// (target_ios_simulator)EXEC-1: nm libmy_test1.a | grep -E "T.*(foo|fxx)" 
// (target_ios_simulator)EXEC: nm libmy_test1.a | grep -E "T.*(hw)" 
// (target_ios_simulator)EXEC: %compiler %compilation_options %extra_options %sanitizer_options %mock_options %optimization_options %debug_options %linkage_options %f  libmy_test2.a -o %output
// (target_ios_simulator)RUN-EXEC: %run %run_opt %output %run_args

func cj_main(){
   
    return 0
}

@C
public func cangjie_main():Unit{
    var ret = 1
    try{
        ret =Int64(cj_main())

    }catch(e:Exception){
        ret = 1
        e.printStackTrace()
    }finally{
        print("cj_main_return_start${ret}cj_main_return_end")
    }



}