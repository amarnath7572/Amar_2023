import java.lang.*;
import java.util.*;

class sum
{
public static void main(String[] args)
{
	double sum=0;
	for(String i:args)
	{
		if(i.matches("[0-9\\.]+"))
			sum=sum+Double.parseDouble(i);
	}
		
	System.out.println(sum);
}
}

