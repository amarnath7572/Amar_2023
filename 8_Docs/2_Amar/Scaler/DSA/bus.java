import java.util.ArrayList;

import java.io.*;
import java.util.*;


public class bus {
	
	public static int bus(int[] A, int B)
	{
		int sum =0,max=0, N = A.length;
		for(int i=0;i<N;i++)
		{
			sum=sum+A[i];
			max=Math.max(sum, max);
		}
		if(A[0]>0) return B-max+1;
		else return B-max;
	}
	
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
	
		int[] A = {-1,1};
		int B = 5;
		
		System.out.println(bus(A,B));
		
		
		
	
		
		
		


	} 

}
