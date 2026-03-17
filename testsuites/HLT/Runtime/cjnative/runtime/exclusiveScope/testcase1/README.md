
## Env

```shell
# 配置CANGJIE_HOME
# export CANGJIE_HOME=/path/to/cangjie

# 配置JAVA_HOME
# export CANGJIE_HOME=/path/to/jdk
```

## Build & Run

```shell
cd test_cangjie
./build.sh
```

## Code
```shell
.
├── README.md
├── build.sh
├── cj
│   └── javaCallcj.cj        # cangjie
├── cpp
│   ├── Cangjie.h
│   ├── Main.h
│   └── call_cangjie.cpp     # 桥接CPP
└── java
    ├── Callback.java
    └── Main.java
```

### 主要流程
```text
Java Main -> Cpp nativeEntry -> Cangjie callNative -> Cpp triggerCallback -> Java Callback
```

### spawn问题说明

- cangjie 开启spawn之后，调用Cpp代码，Cpp就无法再调用java。(jni env为空 或者 调用java方法触发异常导致闪退)
当前解决办法是在Cpp 新启动native线程。

```cangjie
public func callNative(): Unit {
    unsafe {
        let cmsg = LibC.mallocCString("cangjie -> cpp -> java!")

        // 在cangjie spawn里调用会触发未知行为
        triggerCallback(0, cmsg)

        // 在不在cangjie spawn都可以正常运行
        // triggerCallbackWithNewNativeThread(0, cmsg)
    }
}

@C
public func cjOnEvent(): Unit {
    spawn {
        callNative()
    }
}
```

- cangjie 开启spawn之后，调用Cpp代码。 Cpp无法直接`FindClass`去加载java类。
```cangjie
public func callNative(): Unit {
    unsafe {
        ...

        // cj -> cpp FindClass("Hello")
        printJavaHello()
    }
}
```

```cpp
void printJavaHello()
{
    JNIEnv* env = GetJniEnv();  // 新runtime方案貌似这里就直接返回nullptr
    if (env == nullptr) {
        std::cout << "jni env is null!" << std::endl;
        return;
    }
    jclass cls = env->FindClass("Hello"); // cls will be nullptr
    jmethodID constructor = env->GetMethodID(cls, "<init>", "()V");
    jobject obj = env->NewObject(cls, constructor);
    jmethodID printHello = env->GetMethodID(cls, "printHello", "()V");
    env->CallVoidMethod(obj, printHello);
    g_vm->DetachCurrentThread();
}
```