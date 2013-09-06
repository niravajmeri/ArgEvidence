package trust;


public abstract class Trust {
	
	public enum Type {
		MaxCertainty, CertProp, FastMaxCertainty, FastCertProp, Naive
	}
	
	public static Trust create(Type type, double r, double s) throws Exception {
		switch (type) {
		case FastMaxCertainty: return new FastMaxCertainty(r, s);
		case CertProp: return new CertProp(r, s);
		case MaxCertainty: return new MaxCertainty(r, s);
		case FastCertProp: return new FastCertProp(r, s);
		case Naive: return new NaiveTrust(r, s);
		}
		throw new Exception("The data type " + type.toString() + " is not recognized.");
	}
	
	private double r, s;
	private double c;
	
	protected Trust(double r, double s) {
		this.r = r;
		this.s = s;
		this.c = -1;
	}
	
	public abstract Trust clone();
	
	public double r() {
		return r;
	}
	
	public double s() {
		return s;
	}
	
	public double c() {
		if (c == -1) c = certainty();
		return c;
	}
	
	protected abstract double certainty();
	public abstract double p();
	public abstract Trust concatenate(Trust t);
	public abstract Trust aggregate(Trust t);
	public abstract Trust update(Trust t);
	
	public double b() {
		return c() * p();
	}
	
	public double d() {
		return c() * (1 - p());
	}
	
	public double u() {
		return 1 - c();
	}
	
	public String toString() {
		return "[r,s]=[" + r + "," + s + "]"; 
	}

}
