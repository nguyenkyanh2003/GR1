
var check ;
var name;
void main()
{/* 
  if(check == null)
  {
    name = 'Default';
  }
  else{
    name = check;
  } */
//  name = check==null ? 'Default' :check;
// name  =check?? 'Default';//nếu null thì bằng check nếu khác null thì bằng check
List<int> numbers = [];
// numbers.add(1);
// numbers.add(2);
numbers..add(1)..add(2)..add(3);
// numbers.forEach((number){
//   print(number);
// });
for (var i in numbers) {
  print(i);
}
  print(name);

}