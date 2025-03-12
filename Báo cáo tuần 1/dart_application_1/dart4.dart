void main()
{
 /*  bool checkEvent(int n){
     return ( n % 2) == 0;

  }
 print( checkEvent(1));
 print(checkEvent(18));
  bool checkEvent1(int n) => (n%2)==0;
  print(checkEvent1(12)); */
  int tinhtong(int n,int m)
  {
          int sum =0;
          for(int i=n;i<=m;i++)
          sum+=i;

          return sum;
  }
  print(tinhtong(20,100));
  int tinhTongCachDeu(int n,int step)
  {
    int sum=0;
    for(int i=1;i<=n;i+=step)
    sum+=i;
    return sum;
  }
  print(tinhTongCachDeu(200, 16));
  int giaiThua(int n)
  {
    int gt=1;
    for(int i=n;i>=1;i--)
    gt*=i;
    return gt;
  }
  print(giaiThua(5));
}