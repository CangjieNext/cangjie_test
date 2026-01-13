## cfg

1. linux_x86_64.cfg
   ```
    [inherit]
      inherit =
    [condition]
      condition =
    [platform]
      host_os = host_linux
      host_arch = host_x86_64
      target_os = target_linux
      target_arch = target_x86_64
    ```
2. linux_aarch64.cfg
    ```
    [inherit]
      inherit = linux_x86_64.cfg
    [condition]
      condition =
    [platform]
      host_os = host_linux
      host_arch = host_aarch64
      target_os = target_linux
      target_arch = target_aarch64
    ```
3. win_x86_64.cfg
   ```
    [inherit]
      inherit = linux_x86_64.cfg
    [condition]
      condition =
    [platform]
      host_os = host_win
      host_arch = host_x86_64
      target_os = target_win
      target_arch = target_x86_64
    ```
4. mac_aarch64.cfg
   ```
    [inherit]
      inherit = linux_aarch64.cfg
    [condition]
      condition =
    [platform]
      host_os = host_mac
      host_arch = host_aarch64
      target_os = target_mac
      target_arch = target_aarch64
    ```
5. mac_aarch64_ohos.cfg
   ```
    [inherit]
      inherit = mac_aarch64.cfg
    [condition]
      condition =
    [platform]
      host_os = host_mac
      host_arch = host_aarch64
      target_os = target_ohos
      target_arch = target_aarch64
    ```
6. win_x86_64_ohos.cfg
   ```
    [inherit]
      inherit = mac_aarch64_ohos.cfg
    [condition]
      condition =
    [platform]
      host_os = host_win
      host_arch = host_x86_64
      target_os = target_ohos
      target_arch = target_aarch64
    ```
7. mac_aarch64_ios.cfg
   ```
    [inherit]
      inherit = mac_aarch64.cfg
    [condition]
      condition =
    [platform]
      host_os = host_linux
      host_arch = host_aarch64
      target_os = target_linux
      target_arch = target_aarch64
    ```
8. mac_aarch64_android.cfg
   ```
    [inherit]
      inherit = linux_x86_64_android.cfg
    [condition]
      condition =
    [platform]
      host_os = host_mac
      host_arch = host_aarch64
      target_os = target_android
      target_arch = target_aarch64
    ```
9.  win_x86_64_android.cfg
    ```
    [inherit]
      inherit = linux_x86_64_android.cfg
    [condition]
      condition =
    [platform]
      host_os = host_win
      host_arch = host_x86_64
      target_os = target_android
      target_arch = target_aarch64
    ```
10. linux_x86_64_android.cfg
    ```
    [inherit]
      inherit = linux_x86_64.cfg
    [condition]
      condition =
    [platform]
      host_os = host_linux
      host_arch = host_x86_64
      target_os = target_android
      target_arch = target_aarch64
    ```

## 用例头编写

用例头测试步骤编写需区分 `host` 和 `target` ，具体如下：
* `EXEC(-PIPE)(-NUM):` 表示 `host` 平台执行命令
* `RUN-EXEC(-PIPE)(-NUM):` 表示 `target` 平台执行命令

如下所示 `%compiler %cmp_opt %f -o %output` 命令仅在 `host` 执行，`%run %run_opt %output %run_args` 命令仅在 `target` 执行。同一份用例搭配不同 `cfg` 使用，可完成用例在不同平台的测试。

```
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args
main() {
    return 0
}
```

> **注意**：用例头编写尽可能使用 `cfg` 中 `[internal-var]` 提供的内置变量来屏蔽不同平台间的命令差异。

部分用例不支持多平台测试，可通过用例头中增加 `condition` 的方式限制用例支持平台。如下所示，该用例不支持 `host` 为 `mac` 和 `win` 平台下执行。

```
// (not host_mac and not host_win) EXEC: %compiler %cmp_opt --apc --apc %f -o %output
// (not host_mac and not host_win) RUN-EXEC: %run %run_opt %output %run_args
main(): Int64 {
    return 0
}
```

若用例针对不同平台有不同的测试命令，也可通过用例头中使用 `condition` 的方式对命令加以区分。如下所示，该用例在 `host` 为 `win` 时拥有不同的运行命令。

```
// DEPENDENCE: date_formatter_02.c
// (host_win) DEPENDENCE: ../zoneinfo.tar.gz
// (host_win) EXEC: tar -xf zoneinfo.tar.gz
// EXEC: %clang %clang_opt date_formatter_02.c -o libdate_formatter_02.%test_suffix
// EXEC: %compiler %cmp_opt -L . -l date_formatter_02 %f -o %output
// (host_win) RUN-EXEC-PIPE-0: %export "CJ_TZPATH=%cd%/zoneinfo" && %run %run_opt %output %run_args | compare %f
// (not host_win)RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan-not Failure
// ASSERT: scan-not Exception
```


