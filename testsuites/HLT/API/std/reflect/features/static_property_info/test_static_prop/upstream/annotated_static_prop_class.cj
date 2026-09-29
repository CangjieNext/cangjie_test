
package upstream

public class AnnotatedStaticPropClass {
    private static var _backing: Int64 = 0

    // 静态属性带 1 个注解
    @StaticPropAnnotation
    public static prop annotatedProp: Int64 {
        get() {
            1
        }
    }

    // 静态属性带 2 个注解（顺序：StaticPropAnnotation 在定义顺序在先）—— 用于验证
    //   "annotations 遍历顺序取决于定义顺序"（reflect_package_classes.md:10542）
    @StaticPropAnnotation
    @SecondStaticPropAnnotation
    public static prop multiAnnotatedProp: String {
        get() {
            "multi"
        }
    }

    // 静态属性重复标注同一注解 —— 用于验证 findAnnotation 文档语义
    //   "重复标注或者无法匹配时返回 None"（reflect_package_classes.md:10842）
    @StaticPropAnnotation
    @StaticPropAnnotation
    public static prop duplicateAnnotatedProp: Bool {
        get() {
            true
        }
    }
}
