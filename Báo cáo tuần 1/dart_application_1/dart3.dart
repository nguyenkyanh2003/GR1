void main()
{
/* /*   int n=100;
  if(n%2==0){
  print('$n la so chan');
  print("$n^2 bang ${n*n}");
  }
  else
  print("$n la so le");
  // (dieu kien)? (lenh thuc thi khi dk dung) :khi dk sai

  (n%2==0)? print("$n la so chan"):print("$n la so le");
   
   for(int i=0;i<=10;i++)
   {
    print("$i^2 = ${i*i}");
   } */
   // kiem tra snt
   int n=47;
   int dem=0;
   for(int i=2;i<n;i++)
   {
    if(n%i==0)
    dem++;
   }
   (dem==0)?print("$n la so nguyen to"):print("$n khong phai so nguyen to");

   List<String> S = ["A","B","C","D"];
   for(final s in S)
   {
    print(s);
   } */
  var i=0;
  while(i<10){
  print("Number $i");
  i++; 
  }
}