public class TipoCurva{
  ArrayList<Vector> puntos;
  
  public int calcFact(int input){
    int res=1;
    while(res!=0){
      res=res*input;
      input--;
    }
    return res;
  }
    public void setPoints(ArrayList<Vector> entrada){
      stroke(122,122,122);
      this.puntos=entrada;
  }
}
public class Hermite extends TipoCurva{
  public void calcular(){
    Vector lin,act=null;
    for(int i=1;i<puntos.size()-2;i++){
      Vector p0 = puntos.get(i);
      Vector p1 = puntos.get(i+1);
      act=p0;
      for(float t=0;t<=1;t=t+0.1){
        Vector temp1=Vector.multiply(p0,(2*pow(t,3)-3*pow(t,2)+1));
        Vector temp2=Vector.multiply(Vector.multiply( Vector.subtract( puntos.get(i+1), puntos.get(i-1) ), 0.5 ),pow(t,3)-2*pow(t,2)+t);
        Vector aux1 = Vector.add(temp1,temp2);
        temp1=Vector.multiply(p1,(-2*pow(t,3)+3*pow(t,2)));
        temp2=Vector.multiply((Vector.multiply( Vector.subtract( puntos.get(i+2), puntos.get(i) ), 0.5 )),pow(t,3)-pow(t,2));
        Vector aux2 = Vector.add(temp1,temp2);
        lin= Vector.add(aux1,aux2);
        line(act.x(),act.y(),act.z(),lin.x(),lin.y(),lin.z());
        act=lin;
      }
    
  }
 }

}
public class Bezier3 extends TipoCurva{
  public void calcular(){
    Vector calctot,act=null;
    int num= puntos.size();
    for(int i=1;i<puntos.size()-4;i=i+4){
      Vector p0 = puntos.get(i);
      Vector p1 = puntos.get(i+1);
      Vector p2 = puntos.get(i+2);
      Vector p3 = puntos.get(i+3);
      act=p0;
      for(float t=0; t<=1; t=t+0.01){
      float rel= 1-t;
      Vector calc1 = Vector.add(Vector.multiply(p0,(pow(rel,3))),Vector.multiply(p1,(3*t*pow(rel,2))));
      Vector calc2 = Vector.add(Vector.multiply(p2,(3*rel*pow(t,2))),Vector.multiply(p3,pow(t,3)));
       calctot= Vector.add(calc1,calc2);
      line(act.x(),act.y(),act.z(),calctot.x(),calctot.y(),calctot.z());
      act=calctot;   
      }
     
    }
    
  }

}
public class Bezier7 extends TipoCurva{
  public void calcular(){
    Vector calctot,act=null;
    int num= puntos.size();
    for(int i=1;i<puntos.size()-8;i=i+8){
      Vector p0 = puntos.get(i);
      Vector p1 = puntos.get(i+1);
      Vector p2 = puntos.get(i+2);
      Vector p3 = puntos.get(i+3);
      Vector p4 = puntos.get(i+4);
      Vector p5 = puntos.get(i+5);
      Vector p6 = puntos.get(i+6);
      Vector p7 = puntos.get(i+6);
      act=p0;
      for(float t=0; t<=1; t=t+0.01){
      float rel= 1-t;
      Vector calc1 = Vector.add(Vector.multiply(p0,(pow(rel,7))),Vector.multiply(p1,(7*t*pow(rel,6))));
      Vector calc2 = Vector.add(Vector.multiply(p2,(pow(rel,5)*pow(t,2)*21)),Vector.multiply(p3,(35*pow(t,4)*pow(rel,4))));
      Vector calc3 = Vector.add(Vector.multiply(p4,(pow(rel,3)*pow(t,3)*35)),Vector.multiply(p5,(21*pow(t,2)*pow(rel,2))));
      Vector calc4 = Vector.add(Vector.multiply(p6,(7*rel*pow(t,6))),Vector.multiply(p7,pow(t,7)));
      Vector calcaux= Vector.add(calc1,calc2);
      Vector calcaux2= Vector.add(calc3,calc4);
      calctot= Vector.add(calcaux,calcaux2);
      line(act.x(),act.y(),act.z(),calctot.x(),calctot.y(),calctot.z());
      act=calctot;   
      }
   
    }
    
  }

}
