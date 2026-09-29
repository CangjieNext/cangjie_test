
package upstream

public class AnnotatedFuncClass {
    public var value: Int64 = 0i64

    // 函数带 1 个注解
    @FuncAnnotation
    public func annotatedMethod(): Int64 {
        return 42
    }

    // 函数带 2 个注解（顺序：FuncAnnotation 在定义顺序在先）—— 用于验证
    //   "annotations 遍历顺序取决于定义顺序"（reflect_package_classes.md:4589）
    @FuncAnnotation
    @SecondFuncAnnotation
    public func multiAnnotatedMethod(s: String): String {
        return s
    }
}
