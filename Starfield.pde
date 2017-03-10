Particle[] particles;
int j;
void setup()
{
  size(500, 500);
  
  particles = new Particle[500];
 
  for (j = 0; j < particles.length; j ++)
  {
    particles[j] = new NormalParticle();
  }
  
  particles[17] = new OddballParticle();
  particles[200] = new JumboParticle();
  
}

void draw()
{
   background(#151846);
   for (int i = 0; i < particles.length; i ++)
  {
    particles[i].show();
    particles[i].move();
    fill((float)(Math.random() * 250), (float)(Math.random() * 250), (float)(Math.random() * 250));
  }
}
class NormalParticle implements Particle
{
   double speed;
   double dTheta;
   double dX;
   double dY;
  public NormalParticle()
  {
    speed = Math.random() * 10;
    dTheta = Math.random() * (2 * Math.PI);
    dX = 250;
    dY = 250;
  }
  
  public void move()
  {
      dX += (speed * Math.cos(dTheta));
      dY += (speed * Math.sin(dTheta));
    if (dX > 501 || dY > 501)
    {
      dX = 250;
      dY = 250;
      dTheta = Math.random() * (2 * Math.PI);
    }
    else if (dX < -1 || dY < -1)
    {
      dX = 250;
      dY = 250;
      dTheta = Math.random() * (2 * Math.PI);
    }
  }
  
  public void show()
  {
    ellipse((float)dX, (float)dY, 6, 6);
  }
  
}
interface Particle
{
  public void move();
  public void show();
}
class OddballParticle implements Particle
{
  int x, y;
  public void move()
  {
    if (x > 500)
    {
      x = (int)(Math.random() * 500);
      y = (int)(Math.random() * 500);
    }
    else 
    {
      x += (float)(Math.random() * 10);
      y += (float)(Math.random() * 10);
    }
  }
  public void show()
  {
    rect(x, y, 25, 25);
  }
}
class JumboParticle extends NormalParticle
{
   public void move()
  {
      dX += (speed * Math.cos(dTheta));
      dY += (speed * Math.sin(dTheta));
     if (dX > 501 || dY > 501)
    {
      dX = 250;
      dY = 250;
      dTheta = Math.random() * (2 * Math.PI);
    }
    else if  (dX < -1 || dY < -1)
    {
      dX = 250;
      dY = 250;
      dTheta = Math.random() * (2 * Math.PI);
    }
  }
  
  public void show()
  {
    ellipse((float)dX, (float)dY, 50, 50);
  }
}
