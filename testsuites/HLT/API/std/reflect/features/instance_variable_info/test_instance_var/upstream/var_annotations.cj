
package upstream

// 自定义注解（@Annotation 元注解声明反射可见）
@Annotation
public class VarAnnotation {
    public let data: String
    public const init() {
        this.data = "VarAnnotation's data"
    }
}

@Annotation
public class SecondVarAnnotation {
    public let code: Int64
    public const init() {
        this.code = 42
    }
}
