#include <stdio.h>
void main()
{
	int arr[] = { -10, -10, 20, 20, 20,30,30,40,50,60,60,70 };
	int len_arr, mid, x, i, res;
	len_arr = (int)sizeof(arr) / sizeof(arr[0]);
	printf("array elements : \n");
	for (i = 0; i < len_arr; i++)
	{
		printf("%d ", arr[i]);
	}
	printf("\n\nPlease enter x: ");
	scanf_s("%d", &x);
	res = bsearch(arr, len_arr, x);

	printf("\nres = %d\n\n", res);


}
	
int bsearch(const int a[], int n, int x)
{
		int low = 0;
		int high = n - 1;
		while (low <= high)
		{
			int mid = (low + high) / 2;

			if (a[mid]<x && a[mid + 1]>=x)
			{
				return mid + 1;
			}
			else if (x <= a[mid])
				high = mid - 1;
			else
				low = mid + 1;
		}
		return -1;
}
