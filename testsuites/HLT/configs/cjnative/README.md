# 内部变量介绍

## `cangjie_test`

本地 `cangjie_test` git仓目录的绝对路径，需要用户手动设置环境变量 `CANGJIE_TEST` 指向该目录

## `compiler`

cjc 编译器

## `compiler_frontend`

cjc-frontend 编译器前端

## `cmp_opt`

cjc 编译选项

## `cmp_opt_frontend`

cjc-frontend 编译器前端选项

## `output`

当 cjc 编译产物为可执行文件时，使用 %output 来自动取名

## `suffix`

可执行文件的后缀名

## `test_suffix`

静态库文件的后缀名

## `middle`

静态库文件的后缀名

## `null_path`

操作系统的黑洞文件的路径，用于丢弃不关心的输出内容

## `serial_compile`

是否开启串行编译

## `close_apc_compile`

是否关闭 apc 并发编译

## `hle_c`

hle 工具进行 C 胶水层生成

## `hle_arkts`

hle 工具进行 ArkTS 胶水层生成

## `cjcpl`

cjcpl 工具

## `old_cjo`

暂无介绍

## `new_cjo`

暂无介绍

## `cjfmt`

cjfmt 工具

## `lint`

cjlint 工具

## `cangjieDir`

`CANGJIE_HOME` 环境变量

## `cangjie-home`

`CANGJIE_HOME` 环境变量

## `cangjieStdxPath`

`CANGJIE_STDX_PATH` 环境变量

## `cjcov`

cjcov 工具

## `cjtrace_recover`

cjtrace-recover 工具

## `export`

设置环境变量的命令，操作系统相关

## `source`

刷新环境变量的命令，操作系统相关

## `run`

可执行文件的执行环境，一般会设置环境变量

## `run_pkg`

可执行文件的执行环境，一般会设置环境变量

## `run_macro`

可执行文件的执行环境，一般会设置环境变量

## `run_stdx`

可执行文件的执行环境，一般会设置环境变量，针对 STDX 设置运行时环境变量

## `run_opt`

运行可执行文件时的设置

## `cangjie-stdx-list`

所有 stdx 的库链接的列表，方便用例测试头部指定链接所有 stdx 库

## `run_args`

运行可执行文件时传入的参数

## `run_args_arg`

暂无介绍

## `static_std`

--static-std 编译选项

## `dy_std`

--dy-std 编译选项

## `static_libs`

--static-libs 编译选项

## `dy_libs`

--dy-libs 编译选项

## `ldd`

ldd 工具

## `main`

可执行文件名

## `mod_opt`

--module-name 编译选项

## `mod_name`

--module-name xxx

## `pkg_opt`

--package 编译选项

## `compile_lib_opt`

如果确定只希望编静态库的话，则用 %compile_lib_opt

## `extra_options`

额外的编译选项

## `compile_dylib_opt`

如果你确定只希望编动态库的话，用 %compile_dylib_opt

## `compile_chir_opt`

编译产物类型为 CHIR 文件

## `compile_dylib_opt_cjmp`

用于CJMP用例

## `compile_lib_opt_cjmp`

用于CJMP用例

## `link_cjmp`

用于CJMP用例

## `cmp_stable_abi_dylib`

用于兼容性测试套，链接上游包

## `enableConstPropagation`

--fchir-constant-propagation 选项

## `incremental_compile`

开启增量编译选项

## `overflow_wrapping`

--int-overflow=wrapping

## `conditional_compilation_config_opt`

暂无介绍

## `link-core`

-lcangjie-std-core

## `link_collection`

暂无介绍

## `link-eh`

-lstdx.effect --experimental --enable-eh

## `stdx-package`

暂无介绍

## `cangjie-stdx-package`

暂无介绍

## `stdx-library-path`

暂无介绍

## `import-cangjie-stdx`

暂无介绍

## `cffi_output`

暂无介绍

## `ffic_opt`

暂无介绍

## `pkg_compile`

暂无介绍

## `pkg_link`

暂无介绍

## `cffi_runtime_opt`

暂无介绍

## `cffi_runtime_link`

暂无介绍

## `cffi_runtime_link_no_elfloader`

暂无介绍

## `optimization_options`

暂无介绍

## `debug_options`

暂无介绍

## `sanitizer_options`

暂无介绍

## `cffi_runtime_ld`

暂无介绍

## `cffi_std_link`

暂无介绍

## `sanitizer_hwasan`

暂无介绍

## `boundscheck`

链接 libboundscheck

## `cffi_suffix`

暂无介绍

## `set`

暂无介绍

## `plugin_lsp_suffix`

暂无介绍

## `chir-dis`

暂无介绍

## `clang`

如果一定要用clang，用%clang

## `gcc`

如果一定要用gcc，用%gcc

## `openssl_path`

保存openssl静态库的目录的路径，需要配在环境变量中

## `c_compiler`

如果不确定用gcc还是clang，用%c_compiler

## `clang_opt`

暂无介绍

## `ls`

target 平台上的 ls 操作

## `host_ls`

host 平台上的 ls 操作

## `host_cp`

host 平台上的 cp 操作

## `target_ls`

target 平台上的 ls 操作

## `target_cp`

target 平台上的 cp 操作

## `libdir`

暂无介绍

## `cat`

暂无介绍

## `mv`

暂无介绍

## `rm`

暂无介绍

## `cp`

暂无介绍

## `touch`

暂无介绍

## `diff`

暂无介绍

## `grep`

暂无介绍

## `sed`

暂无介绍

## `sed_opt`

暂无介绍

## `chmod`

暂无介绍

## `pwd`

暂无介绍

## `mkdir`

暂无介绍

## `rmdir`

暂无介绍

## `use_ast`

暂无介绍

## `use_pic_ast`

暂无介绍

## `pic_opt`

暂无介绍

## `macro_lib_opt`

暂无介绍

## `append_opt`

暂无介绍

## `append_pic_opt`

暂无介绍

## `append_macro_lib_opt`

暂无介绍

## `macro_debug`

暂无介绍

## `enable_macro`

暂无介绍

## `cmp_macro`

暂无介绍

## `macro_lib`

暂无介绍

## `macro_opt`

暂无介绍

## `run_macro_opt`

暂无介绍

## `cjpm_opt`

暂无介绍

## `cjpm`

暂无介绍

## `cpm_bin_path`

暂无介绍

## `python`

暂无介绍

## `dump`

暂无介绍

## `closebuf`

暂无介绍

## `export_expand`

暂无介绍

## `object_file_suffix`

暂无介绍

## `git_dir_prefix`

暂无介绍

## `git_dir_suffix`

暂无介绍

## `obf_string`

暂无介绍

## `no_obf_string`

暂无介绍

## `obf_const`

暂无介绍

## `no_obf_const`

暂无介绍

## `obf_layout`

暂无介绍

## `no_obf_layout`

暂无介绍

## `obf_cf_flatten`

暂无介绍

## `no_obf_cf_flatten`

暂无介绍

## `obf_cf_bogus`

暂无介绍

## `no_obf_cf_bogus`

暂无介绍

## `obf_export`

暂无介绍

## `prebuilt-toolchain`

NDK 的 `toolchains` 目录，该目录下存在 `llvm` 子目录

## `no_obf_export`

暂无介绍

## `obf_sym_input`

暂无介绍

## `obf_sym_output`

暂无介绍

## `obf_apply_mapping`

暂无介绍

## `obf_sym_prefix`

暂无介绍

## `obf_source_path`

暂无介绍

## `no_obf_source_path`

暂无介绍

## `obf_line_number`

暂无介绍

## `no_obf_line_number`

暂无介绍

## `obf_all`

暂无介绍

## `save_temps`

暂无介绍

## `disassembler`

暂无介绍

## `cmp_output`

暂无介绍

## `compilation_options`

基本的编译选项，包括交叉编译选项

## `linkage_options`

静态/动态链接

## `dylib_suffix`

target 平台的动态库文件后缀名

## `cmp_utest_opt`

暂无介绍

## `shell`

暂无介绍

## `run_utest_opt`

暂无介绍

## `utest_no_progress`

暂无介绍

## `java`

暂无介绍

## `compile_executable`

cjc 编译可执行文件

## `javac`

暂无介绍

## `java_mirror_gen`

暂无介绍

## `java_interop_template`

暂无介绍

## `java_interop_util`

暂无介绍

## `java_interop_runner`

暂无介绍

## `java_interop_setup`

暂无介绍

## `cp_loader_jar`

暂无介绍

## `jffi_link`

链接 Java 互操作相关库

## `cangjie-repo-token`

用于中心仓测试用例，token 以环境变量形式传入用例

## `repo_sed`

用于中心仓测试用例

## `host_dylib_suffix`

host平台动态库文件后缀名，加上了host前缀以与dylib_suffix区分。由于绝大多数动态库文件都是用于target平台，所以target平台动态库文件后缀名就不加target前缀，以图简洁

## `cangjie-stdx-path`

STDX 根目录的绝对路径

## `cangjie-static-stdx-path`

保存静态库版本 STDX 的目录的绝对路径

## `cangjie-dynamic-stdx-path`

保存动态库版本 STDX 的目录的绝对路径

## `check-dylib-dep`

查看二进制文件的动态库依赖信息，不同操作系统平台所使用的工具各不相同

## `cangjie_runtime_link`

暂无介绍

## `link_oc`

暂无介绍

## `host`

仓颉 SDK 中 host 平台的库的目录名

## `target`

仓颉 SDK 中 target 平台的库的目录名

## `java_home`

当前环境中的 JAVA_HOME 环境变量的值

## `ohos_opt`

ohos&android的系统工具链编译选项。TODO: 拆分开区别ohos&android。

## `ohos_opt_pc`

用于cjc-frontend

## `clang_opt_objc`

暂无介绍

## `cmp_ocffi_opt`

暂无介绍

## `mirror_gen`

Objective-C 镜像生成器

## `ins_nm_cjworld`

暂无介绍

## `mirror_opt`

暂无介绍

## `enable_objc_cjmapping`

使能 cjc Objective-C 互操作

## `run_env`

仓颉 SDK 中 target 平台的库的目录名，遗留变量，不建议使用，未来将删除，完全同 %target

## `interop_config`

指定互操作配置文件

## `compile_library`

如果你希望用例中既能编动态库也能编静态库的话，就用这个变量。使用static配置文件时该变量为--output-type=staticlib；使用dynamic配置文件时该变量为--output-type=dylib

## `library_suffix`

如果使用%compile_library来动态决定是动态库还是静态库，则使用%library_suffix

## `host_library_suffix`

host 平台上的动态/静态库文件的后缀名，具体取值取决于是 static 配置文件还是 dynamic 配置文件

## `host_triple`

host 平台三元组

## `target_triple`

target 平台三元组

