import java.util.ArrayList;

import java.io.*;
import java.util.*;


public class colors {
	
	public static int colors(int[] A)
	{
		int N = A.length;
		int count = 0;
		
		HashMap<Integer, Integer> map = new HashMap<Integer, Integer>();
		for(int i=0;i<N;i++)
			map.put(A[i], i);
		
		for(int i=0;i<N;i++)
        {
            if(A[i]!=i+1)
            {
                int index = map.get(i+1);
                map.put(A[i],index);
                
                int t = A[i];
                A[i]=A[index];
                A[index]=t;
                count++;
                
//                map.put(i,i);
            }
        }
		
		return N-count;

	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
	
		int[] A = {1,4,2,3};
		
		System.out.println(colors(A));
		
		
		
		
		
	
		
		
		


	} 

}
