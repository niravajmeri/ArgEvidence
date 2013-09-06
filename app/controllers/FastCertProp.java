package trust;


// with fast certainty function
public class FastCertProp extends Trust {
	
	public FastCertProp(double r, double s) {
		super(r, s);
	}

	public double p() {
		if ((r()+s()) == 0) return 0;
		return r()/(r()+s());
	}

	public Trust update(Trust t) {
	    double p2 = t.p();
	    double p1 = this.p();
	    double c1 = this.c();
	    double a = Math.pow(p2, t.r()) * Math.pow((1-p2), t.s());
	    double b = Math.pow(p1, t.r()) * Math.pow((1-p1), t.s());
	    double q = b/a;
	    
	    return new FastCertProp(c1*q, c1*(1-q));
	}
	
	public Trust concatenate(Trust t) {
		double b1 = this.b();
		return new FastCertProp(b1 * t.r(), b1 * t.s());
	}
	
	public Trust aggregate(Trust t) {
		return new FastCertProp(this.r() + t.r(), this.s() + t.s());
	}
	
	public double certainty() {
		return certaintyIntegral(r(), s(), 10) / 2;
	}

	private double certaintyIntegral(double r, double s, int steps) {
		double sum = 0;
		double p = p();
		double q = certaintyBinomial(r, s, steps)/Math.pow(p,r)/Math.pow(1-p,s);
		double a1 = 0;
		double a2 = 0;
		double a3 = 0;
		double a4 = 0;
		double b0 = 0;
		double b1 = 0;
		double b2 = 0;
		double b3 = 0;
		int i =  steps;
		double a = 0;
		double b = 1;

		while (i > 0) {
			a4 = Math.pow(p,(double) i);
			double h = (a4 - a)/4;
			a1 = a + h;
			a2 = a + 2 * h;
			a3 = a4 - h;
			/*
			double f0 = Math.abs(Math.pow(Math.pow(a/p, r/s) * (1-a)/(1-p), s) - q);
			double f1 = Math.abs(Math.pow(Math.pow(a1/p, r/s) * (1-a1)/(1-p), s) - q);
			double f2 = Math.abs(Math.pow(Math.pow(a2/p, r/s) * (1-a2)/(1-p), s) - q);
			double f3 = Math.abs(Math.pow(Math.pow(a3/p, r/s) * (1-a3)/(1-p), s) - q);
			double f4 = Math.abs(Math.pow(Math.pow(a4/p, r/s) * (1-a4)/(1-p), s) - q);
			*/
			double f0 = Math.abs(Math.pow(a/p, r) * Math.pow((1-a)/(1-p), s) - q);
			double f1 = Math.abs(Math.pow(a1/p, r) * Math.pow((1-a1)/(1-p), s) - q);
			double f2 = Math.abs(Math.pow(a2/p, r) * Math.pow((1-a2)/(1-p), s) - q);
			double f3 = Math.abs(Math.pow(a3/p, r) * Math.pow((1-a3)/(1-p), s) - q);
			double f4 = Math.abs(Math.pow(a4/p, r) * Math.pow((1-a4)/(1-p), s) - q);
			
			sum += 2 * h * (7 * f0 + 32 * f1 + 12 * f2 + 32 * f3 + 7 * f4) / 45;
			b0 = 1 - Math.pow(1-p, (double) i);
			h = (b - b0)/4;
			b1 = b0 + h;
			b2 = b0 + 2 * h;
			b3 = b - h;
			/*
			f0 = Math.abs(Math.pow(Math.pow(b0/p, r/s) * (1-b0)/(1-p), s) - q);
			f1 = Math.abs(Math.pow(Math.pow(b1/p, r/s) * (1-b1)/(1-p), s) - q);
			f2 = Math.abs(Math.pow(Math.pow(b2/p, r/s) * (1-b2)/(1-p), s) - q);
			f3 = Math.abs(Math.pow(Math.pow(b3/p, r/s) * (1-b3)/(1-p), s) - q);
			f4 = Math.abs(Math.pow(Math.pow(b/p, r/s) * (1-b)/(1-p), s) - q);
			*/
			f0 = Math.abs(Math.pow(b0/p, r) * Math.pow((1-b0)/(1-p), s) - q);
			f1 = Math.abs(Math.pow(b1/p, r) * Math.pow((1-b1)/(1-p), s) - q);
			f2 = Math.abs(Math.pow(b2/p, r) * Math.pow((1-b2)/(1-p), s) - q);
			f3 = Math.abs(Math.pow(b3/p, r) * Math.pow((1-b3)/(1-p), s) - q);
			f4 = Math.abs(Math.pow(b/p, r) * Math.pow((1-b)/(1-p), s) - q);
			
			sum += 2 * h * (7 * f0 + 32 * f1 + 12 * f2 + 32 * f3 + 7 * f4) / 45;
			a = a4;
			b = b0;
			i--; 

		}

		return Math.abs(sum / q);
	}

	private double certaintyBinomial(double r, double s, int steps) {
		double sum = 0;
		double p = p();
		double a1 = 0;
		double a2 = 0;
		double a3 = 0;
		double a4 = 0;
		double b0 = 0;
		double b1 = 0;
		double b2 = 0;
		double b3 = 0;
		int i = steps;
		double a = 0;
		double b = 1;

		while (i > 0) {
			a4 = Math.pow(p,(double) i);
			double h = (a4 - a)/4;
			a1 = a + h;
			a2 = a + 2 * h;
			a3 = a4 - h;
			/*
			double f0 = Math.pow(Math.pow(a/p, r/s) * (1-a)/(1-p), s);
			double f1 = Math.pow(Math.pow(a1/p, r/s) * (1-a1)/(1-p), s);
			double f2 = Math.pow(Math.pow(a2/p, r/s) * (1-a2)/(1-p), s);
			double f3 = Math.pow(Math.pow(a3/p, r/s) * (1-a3)/(1-p), s);
			double f4 = Math.pow(Math.pow(a4/p, r/s) * (1-a4)/(1-p), s);
			*/
			double f0 = Math.pow(a/p, r) * Math.pow((1-a)/(1-p), s);
			double f1 = Math.pow(a1/p, r) * Math.pow((1-a1)/(1-p), s);
			double f2 = Math.pow(a2/p, r) * Math.pow((1-a2)/(1-p), s);
			double f3 = Math.pow(a3/p, r) * Math.pow((1-a3)/(1-p), s);
			double f4 = Math.pow(a4/p, r) * Math.pow((1-a4)/(1-p), s);
			
			sum += 2 * h * (7 * f0 + 32 * f1 + 12 * f2 + 32 * f3 + 7 * f4) / 45;
			b0 = 1 - Math.pow(1-p, (double) i);
			h = (b - b0)/4;
			b1 = b0 + h;
			b2 = b0 + 2 * h;
			b3 = b - h;
			/*
			f0 = Math.pow(Math.pow(b0/p, r/s) * (1-b0)/(1-p), s);
			f1 = Math.pow(Math.pow(b1/p, r/s) * (1-b1)/(1-p), s);
			f2 = Math.pow(Math.pow(b2/p, r/s) * (1-b2)/(1-p), s);
			f3 = Math.pow(Math.pow(b3/p, r/s) * (1-b3)/(1-p), s);
			f4 = Math.pow(Math.pow(b/p, r/s) * (1-b)/(1-p), s);
			*/
			f0 = Math.pow(b0/p, r) * Math.pow((1-b0)/(1-p), s);
			f1 = Math.pow(b1/p, r) * Math.pow((1-b1)/(1-p), s);
			f2 = Math.pow(b2/p, r) * Math.pow((1-b2)/(1-p), s);
			f3 = Math.pow(b3/p, r) * Math.pow((1-b3)/(1-p), s);
			f4 = Math.pow(b/p, r) * Math.pow((1-b)/(1-p), s);
			
			sum += 2 * h * (7 * f0 + 32 * f1 + 12 * f2 + 32 * f3 + 7 * f4) / 45;
			a = a4;
			b = b0;
			i--; 

		}

		return sum * Math.pow(p,r) * Math.pow(1-p,s);
	}
	
	@Override
	public Trust clone() {
		return new FastCertProp(r(), s());
	}
	
	public static void main(String[] args) {
		System.out.println(new FastCertProp(20d, 4d).c());
		System.out.println(new FastCertProp(12d, 12d).c());
	}
}
