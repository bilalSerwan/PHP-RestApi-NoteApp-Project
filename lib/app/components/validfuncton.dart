 validInput(String? val,int min,int max){

  if(val!.isEmpty){
    return 'Field cannot be empty';
  }
  if(val.length > max){
    return 'must be less than $max characters';
  }
  if(val.length < min){
    return 'must be more than $min characters';
    }
}