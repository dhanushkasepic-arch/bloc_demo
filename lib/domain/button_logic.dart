class ButtonLogic {
  void processClick() {
    print(processClick);
    // Business logic goes here.
  }

  int count=0;

  int incrementCount(){
    count+=1;

    print('Incremented count: $count');
    return count;
  }

  int decrementCount(){
    count-=1;
    print('Decremented count: $count');
    return count;

  }

  int resetCount(){
    count=0;
    return count;
  }


}