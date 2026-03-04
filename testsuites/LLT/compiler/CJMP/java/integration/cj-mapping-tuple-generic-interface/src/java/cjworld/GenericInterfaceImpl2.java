package cjworld;

public class GenericInterfaceImpl2 implements GenericInterfaceFloat64Int32 {
    public double foo() {
        return 56.78;
    }

    public int koo() {
        return 8964;
    }

    public void gooT(double t) {
        System.out.println(t);
    }

    public void gooU(int u) {
        System.out.println(u);
    }
}
