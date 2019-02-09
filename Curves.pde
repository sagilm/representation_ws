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
    int num= puntos.size();
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
      line(act.x(),act.y(),act.z(),p1.x(),p1.y(),p1.z());
  }
 }

}
public class Bezier3 extends TipoCurva{}
