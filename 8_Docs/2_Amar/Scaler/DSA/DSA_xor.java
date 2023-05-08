import java.util.ArrayList;

import java.io.*;
import java.util.*;


public class DSA_xor {
	
	
	public static ArrayList<Integer> factors(int A)
	{
		ArrayList<Integer> fac = new ArrayList<Integer>();
		for(int i=1;i*i<=A;i++)
		{
			if(A%i==0) 
			{
				fac.add(i);
				if(i!=A/i) fac.add(A/i);
			}
		}
		
		return fac;
	}
	
	public static boolean isPrime(int A)
	{
		return factors(A).size()==2;
	}
	
	public static int rec(int i, int x, ArrayList<Integer> A, int size)
	{
		if(i==size) return x;
		
		int choice1 = rec(i+1, x^A.get(i),A, size);
		int choice2 = rec(i+1, x, A, size);
		
		return choice1+choice2;
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
	
		int[] A = {3,7};
		int N = A.length;
		int m = 1000000007;
		int sum =0;
		for(int i=0;i<N;i++)
		{
			ArrayList<Integer> fac = factors(A[i]);
			int M = fac.size();
			ArrayList<Integer> prime = new ArrayList<Integer>();
			for(int j=0;j<M;j++)
			{
				if(isPrime(fac.get(j))) prime.add(fac.get(j));
			}
			System.out.println(A[i]+"-"+prime);
			sum = sum+rec(0,0,prime,prime.size());
		}
		
		System.out.println(sum);
		
	
		
		
		


	} 

}
