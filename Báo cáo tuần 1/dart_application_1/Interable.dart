
var numbers = Iterable.generate(10);
void main(){
/* numbers.forEach((number){
  print(number);
}); */
/* for(int i=0;i<numbers.length;i++)
{
  print(numbers.elementAt(i));
} */
for(var number in numbers){
  print(number);

}
print(numbers.length);
print(numbers.first);
print(numbers.isNotEmpty);
}