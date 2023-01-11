//function for checking mouseover

boolean inside(int left, int top, int right, int bottom)
{
  if(mouseX>left && mouseY>top && mouseX<right && mouseY<bottom) //inside 
  {
    return true;
  }
  else //outside
  {
    return false;
  }
}