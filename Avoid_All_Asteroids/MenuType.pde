class MenuType{
  boolean isActive;
  boolean showsTime;
  boolean showsCargo;
  boolean allowsInput;
  boolean enablesPressEnter;
  String txt;
  
  MenuType(String txt_, boolean allowsInput_, boolean showsTime_, boolean showsCargo_, boolean enablesPressEnter_, boolean isActive_){
    txt = txt_;
    isActive = isActive_;
    showsTime = showsTime_;
    showsCargo = showsCargo_;
    allowsInput = allowsInput_;
    enablesPressEnter = enablesPressEnter_;
  }
}
