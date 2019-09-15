void loadStuff(){
  numPages = 1;
  material = new Material();
  ore = new Ore(); 
  if (material.uTools){
    numPages += 1;
    tool = new Tool(numPages);
  }  
  if (material.uBlock || material.uDecor || material.uLight){
    numPages += 1;
    block = new Block(numPages);
  }  
  if (selPage > numPages){selPage = numPages;} 
  ore.getStats(); //this must be last to get value
}  
