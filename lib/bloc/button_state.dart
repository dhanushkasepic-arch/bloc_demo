class ButtonState {
  final bool isButtonClicked;
  final int count;

   ButtonState({
    this.isButtonClicked=false,
    this.count=0,
});

  ButtonState copyWith({
    bool? isButtonClicked, //nullable lets us keep the unchanged values as they were,
                           // without reassigning them,
    int? count,
  }) {
    return ButtonState(
      isButtonClicked: isButtonClicked ?? this.isButtonClicked, //the value cant be null, we
                                                                  // have to return the values.
      count: count ?? this.count,
    );
  }
}

