import java.util.ArrayList;

import java.io.*;
import java.util.*;


public class setBits {
	
	
	
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
	
		int A = 15;
		int B = 2;
		
		int ans = 0;
		
		for(int i=30;i>=0;i--)
		{
			int mask = (1<<i);
			if((mask&A)>0 && B>0)
			{
				ans = ans | mask;
				B--;
			}
		}
		
		int i=0;
		while(B>0)
		{
			int mask = (1<<i);
			if((mask&ans)==0)
			{
				ans=ans|mask;
				B--;
			}
			i++;
		}
		
		System.out.println(ans);
		
	
		
		
		


	} 

}
