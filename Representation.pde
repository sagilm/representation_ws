

 static class Vertex{
  IntList adjacent; 
  Vector vertex;
  
  Vertex(Vector vertex_, IntList adjacent_){
    this.adjacent=adjacent_;
    this.vertex=vertex_;
  }
   static ArrayList<Vertex> lista(){  
   float sc = scale.getValue();
    ArrayList<Vertex> vertexList= new ArrayList<Vertex>();
    vertexList.add(new Vertex(new Vector(3 * sc, 0, 0),new IntList(1,2,3)));   
    vertexList.add(new Vertex(new Vector(-3 * sc, 2 * sc, 0), new IntList(0,2,3)));  
    vertexList.add(new Vertex(new Vector(-3 * sc, -2 * sc, 0), new IntList(0,1,3))); 
    vertexList.add(new Vertex(new Vector(-3 * sc, 0, 2 * sc), new IntList(0,1,2)));  
    return vertexList;
  }

}

class Face{
  Vector v1;
  Vector v2;
  Vector v3;
  Face(Vector v1_, Vector v2_, Vector v3_){
    this.v1=v1_;
    this.v2=v2_;
    this.v3=v3_;
  }
}  


public class VV {
ArrayList<Vertex> vertexList; 

   VV(ArrayList<Vertex> vertexList_){
    this.vertexList=vertexList_;
  }
  
  void Inmediato(){  
    for(int i =0;i<vertexList.size();i++){
      Vertex act= vertexList.get(i);
      for(int j=0;j<act.adjacent.size();j++){
        Vertex vadj=vertexList.get(act.adjacent.get(j));
        line(act.vertex.x(), act.vertex.y(),act.vertex.z(), vadj.vertex.x(), vadj.vertex.y(), vadj.vertex.z());
      }
    }
  }
PShape Retenido(){
    PShape shape = createShape();
    shape.beginShape(TRIANGLE_STRIP);
    for(int i =0;i<vertexList.size();i++){
      Vertex act= vertexList.get(i);
      for(int j=0;j<act.adjacent.size();j++){
        Vertex vadj=vertexList.get(act.adjacent.get(j));
        shape.vertex(act.vertex.x(), act.vertex.y(),act.vertex.z());
        shape.vertex(vadj.vertex.x(), vadj.vertex.y(), vadj.vertex.z());
      }    
    }
    shape.endShape();
  return shape;
  }
}
public class FV{
ArrayList<Vertex> vertexList;
ArrayList<Face> faceList;

FV(ArrayList<Vertex> vertexList_, ArrayList<Face> faceList_){
    this.vertexList=vertexList_;
    this.faceList=faceList_;
  }
  
  void Inmediato(){
    for(int i =0; i<faceList.size();i++){
      Face act= faceList.get(i);
      beginShape(TRIANGLE);
      vertex(act.v1.x(), act.v1.y(), act.v1.z());
      vertex(act.v2.x(), act.v2.y(), act.v2.z());
      vertex(act.v3.x(), act.v3.y(), act.v3.z());
      endShape();
    }
  }
  PShape Retenido(){
  //  PShape shape= createShape();
  //  shape.beginShape(TRIANGLE);
  //   for(int i =0; i<faceList.size();i++){
  //    Face act= faceList.get(i);
  //    vertex(act.v1.x(), act.v1.y(), act.v1.z());
  //    vertex(act.v2.x(), act.v2.y(), act.v2.z());
  //    vertex(act.v3.x(), act.v3.y(), act.v3.z());
  //  }
  // shape.endShape();
  //return shape; 
      PShape shapeFace = createShape();
    shapeFace.beginShape();  
    for(Face cadj: faceList){ //recorre la lista de vertices que tiene una cara 
      vertex(cadj.v1.x(), cadj.v1.y(), cadj.v1.z());
      vertex(cadj.v2.x(), cadj.v2.y(), cadj.v2.z());
      vertex(cadj.v3.x(), cadj.v3.y(), cadj.v3.z());
      
    }
    shapeFace.endShape();
return shapeFace;
  }
  

}

  
