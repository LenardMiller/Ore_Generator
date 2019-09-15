void keyReleased(){
  if (key == 'r'){
    loadStuff();
  }  
  if (key == ' '){
    if (selPage < numPages){
      selPage += 1;  
    }  
    else{
      selPage = 0;  
    }  
  }  
}  
