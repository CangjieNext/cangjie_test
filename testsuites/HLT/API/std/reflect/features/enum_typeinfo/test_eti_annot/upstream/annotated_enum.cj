package upstream

public enum AnnotatedEnum {
    | @Dup @Dup A1
    | @CTag["hello"] A2(Int64)
    | A3
}
