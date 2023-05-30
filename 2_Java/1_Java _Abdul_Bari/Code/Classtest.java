	class Outer
	{
		int x =20;
		
		class Inner
		{
			int y =10;
			void innerDisplay()
			{
				System.out.println("Inner display");
			}
		}
		void outerDisplay()
		{
			System.out.println("Outer display");
			Inner i = new Inner();
			System.out.println(i.y);
			i.innerDisplay();
		}
	}

class Classtest
{
	
	public static void main(String args[])
    {
		Outer o = new Outer();
		System.out.println(o.x);
		o.outerDisplay();
	
    }
       
}